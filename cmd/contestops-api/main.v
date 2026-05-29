module main

import contestops_ai
import net.http
import os

fn main() {
	port := os.getenv_opt('PORT') or { '8080' }
	mut server := http.Server{
		addr:    ':${port}'
		handler: ApiHandler{}
	}
	println('ContestOps AI API listening on ${port}')
	server.listen_and_serve()
}

struct ApiHandler {}

fn (h ApiHandler) handle(req http.Request) http.Response {
	path := req.url.split('?')[0]
	return match path {
		'/', '/health' {
			json_response(200, '{"ok":true,"service":"contestops_ai","version":"0.1.0"}')
		}
		'/manifest' {
			json_response(200, contestops_ai.manifest_json(contestops_ai.default_manifest()))
		}
		'/checklist' {
			text_response(200, 'text/markdown; charset=utf-8',
				contestops_ai.checklist_markdown(contestops_ai.default_manifest()))
		}
		'/evidence' {
			text_response(200, 'text/markdown; charset=utf-8',
				contestops_ai.evidence_markdown(contestops_ai.default_manifest()))
		}
		else {
			json_response(404, '{"ok":false,"error":"not_found"}')
		}
	}
}

fn json_response(status int, body string) http.Response {
	return text_response(status, 'application/json; charset=utf-8', body)
}

fn text_response(status int, content_type string, body string) http.Response {
	return http.Response{
		status_code: status
		header:      http.new_header_from_map({
			http.CommonHeader.content_type: content_type
		})
		body:        body
	}
}
