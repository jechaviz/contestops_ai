module main

import contestops_ai
import os

fn main() {
	args := normalized_args()
	if args.len == 0 || args[0] in ['help', '--help', '-h'] {
		print_help()
		return
	}
	exit_code := run(args) or {
		eprintln(err.msg())
		1
	}
	if exit_code != 0 {
		exit(exit_code)
	}
}

fn normalized_args() []string {
	mut args := os.args[1..].clone()
	if args.len > 0 && args[0] == '--' {
		args.delete(0)
	}
	return args
}

fn run(args []string) !int {
	command := args[0]
	manifest := contestops_ai.manifest_for_profile(profile_name(args))!
	match command {
		'manifest' {
			return write_or_print(args, contestops_ai.manifest_json(manifest))
		}
		'checklist' {
			return write_or_print(args, contestops_ai.checklist_markdown(manifest))
		}
		'evidence' {
			return write_or_print(args, contestops_ai.evidence_markdown(manifest))
		}
		'application-packet' {
			return write_or_print(args, contestops_ai.application_packet_markdown(manifest))
		}
		'strategic-brief' {
			return write_or_print(args, contestops_ai.strategic_brief_markdown(manifest))
		}
		'gemini-smoke' {
			mock := args.contains('--mock')
			prompt := 'Create the next Build with Gemini XPRIZE execution step for ContestOps AI.'
			response := contestops_ai.complete_with_default_provider(prompt, mock)!
			return write_or_print(args, contestops_ai.gemini_receipt_json(response, prompt))
		}
		else {
			return error('unknown command: ${command}')
		}
	}
}

fn profile_name(args []string) string {
	for i, arg in args {
		if arg == '--profile' && i + 1 < args.len {
			return args[i + 1]
		}
		if arg.starts_with('--profile=') {
			return arg.all_after('--profile=')
		}
	}
	return 'default'
}

fn write_or_print(args []string, text string) !int {
	output := output_path(args)
	if output == '' {
		print(text)
		return 0
	}
	dir := os.dir(output)
	if dir != '.' && dir != '' {
		os.mkdir_all(dir)!
	}
	os.write_file(output, text)!
	println(output)
	return 0
}

fn output_path(args []string) string {
	mut skip_next := false
	for i, arg in args[1..] {
		if skip_next {
			skip_next = false
			continue
		}
		if arg == '--profile' {
			skip_next = true
			continue
		}
		if arg.starts_with('--profile=') {
			continue
		}
		if !arg.starts_with('-') {
			return arg
		}
		_ = i
	}
	return ''
}

fn print_help() {
	println('ContestOps AI')
	println('')
	println('Commands:')
	println('  manifest [path]')
	println('  checklist [path]')
	println('  evidence [path]')
	println('  application-packet [path]')
	println('  strategic-brief [path]')
	println('  gemini-smoke [path] [--mock]')
	println('')
	println('Options:')
	println('  --profile raise')
}
