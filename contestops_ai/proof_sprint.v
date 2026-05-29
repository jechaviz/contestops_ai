module contestops_ai

pub fn default_proof_sprint() ProofSprint {
	return ProofSprint{
		name:           'Build with Gemini XPRIZE proof sprint'
		window:         '2026-06-01 to 2026-06-15'
		objective:      'Turn the submission from a strong internal package into a judged business with buyer, user, cloud, and Gemini receipts.'
		metrics:        default_proof_metrics()
		steps:          default_proof_steps()
		win_conditions: [
			'At least 3 independent paid pilots or signed invoices are recorded.',
			'At least 3 user feedback records have permission and redaction status.',
			'Cloud Run deployment and env-backed Gemini receipts are captured.',
			'One redacted case study is public and one judge test guide is ready.',
			'Devpost draft is filled by automation with a human final-submit gate.',
		]
	}
}

pub fn raise_proof_sprint() ProofSprint {
	return ProofSprint{
		name:           'RAISE application proof sprint'
		window:         '2026-05-29 to 2026-06-10'
		objective:      'Convert the pitch packet into a founder-reviewed application with validation, Dealum readiness, and concise investor proof.'
		metrics:        [
			ProofMetric{
				id:       'founder_profiles'
				label:    'Founder profiles'
				target:   2
				current:  0
				status:   'secure_input'
				evidence: 'submission/dealum_payload.json'
			},
			ProofMetric{
				id:       'validation_calls'
				label:    'Validation calls'
				target:   5
				current:  0
				status:   'ready'
				evidence: 'docs/TRACTION_PROOF_MINIMUM.md'
			},
			ProofMetric{
				id:       'dealum_dry_runs'
				label:    'Dealum dry runs'
				target:   2
				current:  1
				status:   'active'
				evidence: 'automation/output'
			},
		]
		steps:          [
			ProofSprintStep{
				day:    'D0'
				title:  'Lock secure founder inputs'
				owner:  'founder'
				output: 'Dealum-ready profile fields'
				status: 'secure_input'
			},
			ProofSprintStep{
				day:    'D1'
				title:  'Record one live application run'
				owner:  'ops'
				output: 'Demo clip and automation receipt'
				status: 'ready'
			},
		]
		win_conditions: [
			'Founder facts are complete in the portal.',
			'At least one live validation signal is attached.',
			'Final submission remains human-approved.',
		]
	}
}

pub fn alibaba_proof_sprint() ProofSprint {
	return ProofSprint{
		name:           'Accio CoCreate pitch proof sprint'
		window:         '2026-05-29'
		objective:      'Hold the completed package at submission-ready quality while preserving authorized external-submit controls.'
		metrics:        [
			ProofMetric{
				id:       'submission_packet'
				label:    'Submission packet'
				target:   1
				current:  1
				status:   'done'
				evidence: 'submission/SUBMISSION_PACKET.md'
			},
			ProofMetric{
				id:       'demo_mvp'
				label:    'Demo MVP'
				target:   1
				current:  1
				status:   'done'
				evidence: 'C:\\git\\websites\\alibaba_cocreate_pitch_2026'
			},
		]
		steps:          [
			ProofSprintStep{
				day:    'D0'
				title:  'Final authorized submit session'
				owner:  'operator'
				output: 'Submission confirmation receipt'
				status: 'ready_for_authorized_session'
			},
		]
		win_conditions: [
			'No private credentials are stored in the package.',
			'External submission happens only in an authorized browser session.',
		]
	}
}

pub fn proof_sprint_markdown(manifest PackageManifest) string {
	sprint := manifest.proof_sprint
	mut lines := []string{}
	lines << '# ${manifest.project_name} Proof Sprint'
	lines << ''
	lines << 'Name: ${sprint.name}'
	lines << ''
	lines << 'Window: ${sprint.window}'
	lines << ''
	lines << sprint.objective
	lines << ''
	lines << '## Metrics'
	lines << ''
	lines << '| Status | Metric | Current | Target | Evidence |'
	lines << '|---|---|---:|---:|---|'
	for metric in sprint.metrics {
		lines << '| ${metric.status} | ${metric.label} | ${metric.current} | ${metric.target} | `${metric.evidence}` |'
	}
	lines << ''
	lines << '## Execution Steps'
	lines << ''
	lines << '| Day | Status | Owner | Step | Output |'
	lines << '|---|---|---|---|---|'
	for step in sprint.steps {
		lines << '| ${step.day} | ${step.status} | ${step.owner} | ${step.title} | ${step.output} |'
	}
	lines << ''
	lines << '## Win Conditions'
	lines << ''
	for condition in sprint.win_conditions {
		lines << '- ${condition}'
	}
	return lines.join('\n') + '\n'
}

fn default_proof_metrics() []ProofMetric {
	return [
		ProofMetric{
			id:       'qualified_targets'
			label:    'Qualified outreach targets'
			target:   20
			current:  0
			status:   'ready'
			evidence: 'sales/outreach_queue.csv'
		},
		ProofMetric{
			id:       'discovery_calls'
			label:    'Discovery calls'
			target:   5
			current:  0
			status:   'ready'
			evidence: 'sales/user_feedback_template.csv'
		},
		ProofMetric{
			id:       'paid_pilots'
			label:    'Paid pilots or signed invoices'
			target:   3
			current:  0
			status:   'must_win'
			evidence: 'sales/revenue_ledger_template.csv'
		},
		ProofMetric{
			id:       'env_gemini_receipts'
			label:    'Env-backed Gemini receipts'
			target:   3
			current:  0
			status:   'planned'
			evidence: 'evidence/private/gemini'
		},
		ProofMetric{
			id:       'cloud_receipts'
			label:    'Cloud Run receipts'
			target:   1
			current:  0
			status:   'planned'
			evidence: 'evidence/private/google_cloud'
		},
		ProofMetric{
			id:       'submission_dry_runs'
			label:    'Submission dry-runs'
			target:   2
			current:  1
			status:   'active'
			evidence: 'automation/output'
		},
	]
}

fn default_proof_steps() []ProofSprintStep {
	return [
		ProofSprintStep{
			day:    'D1'
			title:  'Send targeted founder and SMB outreach'
			owner:  'growth'
			output: '20 logged prospects and first replies'
			status: 'ready'
		},
		ProofSprintStep{
			day:    'D2-D4'
			title:  'Run discovery calls and score pain'
			owner:  'product'
			output: '5 feedback records with consent status'
			status: 'ready'
		},
		ProofSprintStep{
			day:    'D5-D8'
			title:  'Deliver paid pilot packets'
			owner:  'ops'
			output: '3 invoices, paid receipts, or LOI evidence'
			status: 'must_win'
		},
		ProofSprintStep{
			day:    'D9-D10'
			title:  'Deploy Cloud Run and run Gemini receipts'
			owner:  'engineering'
			output: 'Public URL, logs, redacted Gemini receipts'
			status: 'planned'
		},
		ProofSprintStep{
			day:    'D11-D12'
			title:  'Publish redacted case study and judge guide'
			owner:  'submission'
			output: 'Public proof packet and testing guide'
			status: 'planned'
		},
		ProofSprintStep{
			day:    'D13-D14'
			title:  'Fill Devpost draft with automation'
			owner:  'automation'
			output: 'Saved draft trace with final-submit gate'
			status: 'scheduled'
		},
	]
}

fn proof_sprint_json(sprint ProofSprint) string {
	return '{"name":"${escape_json(sprint.name)}","window":"${escape_json(sprint.window)}","objective":"${escape_json(sprint.objective)}","metrics":${proof_metrics_json(sprint.metrics)},"steps":${proof_steps_json(sprint.steps)},"win_conditions":${strings_json(sprint.win_conditions)}}'
}

fn proof_metrics_json(items []ProofMetric) string {
	mut parts := []string{}
	for item in items {
		parts << '{"id":"${escape_json(item.id)}","label":"${escape_json(item.label)}","target":${item.target},"current":${item.current},"status":"${escape_json(item.status)}","evidence":"${escape_json(item.evidence)}"}'
	}
	return '[' + parts.join(',') + ']'
}

fn proof_steps_json(items []ProofSprintStep) string {
	mut parts := []string{}
	for item in items {
		parts << '{"day":"${escape_json(item.day)}","title":"${escape_json(item.title)}","owner":"${escape_json(item.owner)}","output":"${escape_json(item.output)}","status":"${escape_json(item.status)}"}'
	}
	return '[' + parts.join(',') + ']'
}
