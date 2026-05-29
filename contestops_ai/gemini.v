module contestops_ai

import net.http
import os
import time

pub struct MockGeminiProvider {
pub:
	model string = 'gemini-2.5-flash'
}

pub fn (provider MockGeminiProvider) complete(prompt string) !LlmResponse {
	return LlmResponse{
		provider:    'mock_gemini'
		model:       provider.model
		content:     'ContestOps AI plan accepted: ${prompt.limit(96)}'
		raw_body:    '{}'
		mock:        true
		status_code: 200
	}
}

pub struct EnvGeminiProvider {
pub:
	model   string = 'gemini-2.5-flash'
	api_key string
	timeout int = 60000
}

pub fn new_env_gemini_provider() EnvGeminiProvider {
	model := env_default('GEMINI_MODEL', 'gemini-2.5-flash')
	return EnvGeminiProvider{
		model:   model
		api_key: os.getenv('GEMINI_API_KEY')
	}
}

pub fn (provider EnvGeminiProvider) complete(prompt string) !LlmResponse {
	if provider.api_key == '' {
		return error('GEMINI_API_KEY is required for real Gemini calls')
	}
	endpoint := 'https://generativelanguage.googleapis.com/v1beta/models/${provider.model}:generateContent?key=${provider.api_key}'
	mut header := http.new_header()
	header.add_custom('Content-Type', 'application/json')!
	body := gemini_request_body(prompt)
	resp := http.fetch(
		url:           endpoint
		method:        .post
		header:        header
		data:          body
		validate:      true
		read_timeout:  provider.timeout * time.millisecond
		write_timeout: provider.timeout * time.millisecond
	)!
	if resp.status_code < 200 || resp.status_code >= 300 {
		return error('Gemini API returned HTTP ${resp.status_code}')
	}
	return LlmResponse{
		provider:    'gemini_api'
		model:       provider.model
		content:     extract_gemini_text(resp.body)
		raw_body:    resp.body
		mock:        false
		status_code: resp.status_code
	}
}

pub fn complete_with_default_provider(prompt string, mock bool) !LlmResponse {
	if mock {
		provider := MockGeminiProvider{}
		return provider.complete(prompt)
	}
	provider := new_env_gemini_provider()
	return provider.complete(prompt)
}

fn env_default(key string, fallback string) string {
	value := os.getenv(key)
	if value == '' {
		return fallback
	}
	return value
}

fn gemini_request_body(prompt string) string {
	return '{"contents":[{"parts":[{"text":"${escape_json(prompt)}"}]}]}'
}

fn extract_gemini_text(body string) string {
	marker := '"text"'
	start := body.index(marker) or { return body.limit(800) }
	after_marker := body[start + marker.len..]
	colon := after_marker.index(':') or { return body.limit(800) }
	after_colon := after_marker[colon + 1..].trim_space()
	if !after_colon.starts_with('"') {
		return body.limit(800)
	}
	return read_json_string(after_colon[1..])
}

fn read_json_string(value string) string {
	mut out := []u8{}
	mut escaped := false
	for ch in value.bytes() {
		if escaped {
			out << match ch {
				`n` { `\n` }
				`r` { `\r` }
				`t` { `\t` }
				`"` { `"` }
				`\\` { `\\` }
				else { ch }
			}

			escaped = false
			continue
		}
		if ch == `\\` {
			escaped = true
			continue
		}
		if ch == `"` {
			break
		}
		out << ch
	}
	return out.bytestr()
}
