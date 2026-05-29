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
	match command {
		'manifest' {
			return write_or_print(args,
				contestops_ai.manifest_json(contestops_ai.default_manifest()))
		}
		'checklist' {
			return write_or_print(args,
				contestops_ai.checklist_markdown(contestops_ai.default_manifest()))
		}
		'evidence' {
			return write_or_print(args,
				contestops_ai.evidence_markdown(contestops_ai.default_manifest()))
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
	for arg in args[1..] {
		if !arg.starts_with('-') {
			return arg
		}
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
	println('  gemini-smoke [path] [--mock]')
}
