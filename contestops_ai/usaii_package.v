module contestops_ai

pub fn usaii_manifest() PackageManifest {
	return PackageManifest{
		project_name:  'AI Study-to-Work Coach'
		version:       '1.0.0'
		category:      'USAII Global AI Hackathon 2026 / student_partner_track'
		deadline:      '2026-06-21 23:59 ET'
		prod_score:    100
		rules:         usaii_rules()
		milestones:    usaii_milestones()
		evidence:      usaii_evidence()
		integrations:  usaii_integrations()
		scorecard:     usaii_scorecard()
		proof_sprint:  usaii_proof_sprint()
		founder_proof: default_founder_proof()
	}
}

fn usaii_rules() []RuleItem {
	return [
		RuleItem{
			id:       'student_only'
			title:    'Every participant must be an eligible student; working professionals enrolled in degree programs are not eligible.'
			status:   'student_partner_required'
			evidence: 'docs/ELIGIBILITY_STUDENT_CHECKLIST.md'
		},
		RuleItem{
			id:       'team_size'
			title:    'Team must include 2-5 registered Devpost members; no solo final submission.'
			status:   'student_partner_required'
			evidence: 'docs/ELIGIBILITY_STUDENT_CHECKLIST.md'
		},
		RuleItem{
			id:       'qualifier'
			title:    'Team must complete the AI Readiness Qualifier and receive an approval code.'
			status:   'ready_for_qualifier'
			evidence: 'submission/qualifier_response_template.md'
		},
		RuleItem{
			id:       'build_window'
			title:    'Substantial competitive build work must happen during June 14-21, 2026.'
			status:   'guarded'
			evidence: 'docs/HACKATHON_PLAN.md'
		},
		RuleItem{
			id:       'responsible_ai'
			title:    'Submission must explain AI architecture, human-in-loop design, responsible AI guardrails, tools, and data.'
			status:   'done'
			evidence: 'docs/PRODUCT_AI_IDEA.md'
		},
		RuleItem{
			id:       'demo_video'
			title:    'Final Devpost packet must include a working demo or walkthrough and a 3-5 minute pitch video.'
			status:   'ready'
			evidence: 'docs/VIDEO_OUTLINE.md'
		},
		RuleItem{
			id:       'external_submission_automation'
			title:    'WAIBAv playbooks prepare Devpost and qualifier drafts while preserving authorized final-submit gates.'
			status:   'ready_for_authorized_session'
			evidence: 'automation/waiba'
		},
	]
}

fn usaii_milestones() []Milestone {
	return [
		Milestone{
			version: '0.1.0'
			title:   'Official rules, track fit, and student gates verified'
			target:  '2026-05-30'
			status:  'done'
		},
		Milestone{
			version: '0.3.0'
			title:   'Product idea, qualifier prep, and evidence model'
			target:  '2026-05-30'
			status:  'done'
		},
		Milestone{
			version: '0.6.0'
			title:   'V product core and synthetic readiness report'
			target:  '2026-05-30'
			status:  'done'
		},
		Milestone{
			version: '0.8.0'
			title:   'Vue demo MVP and submission packet'
			target:  '2026-05-30'
			status:  'done'
		},
		Milestone{
			version: '1.0.0'
			title:   'Qualifier and hackathon ready for eligible student team'
			target:  '2026-05-30'
			status:  'done'
		},
	]
}

fn usaii_evidence() []EvidenceSlot {
	return [
		EvidenceSlot{
			name:        'official_rules_snapshot'
			status:      'done'
			public_path: 'docs/SOURCES.md'
			private_ref: 'USAII and Devpost official pages'
		},
		EvidenceSlot{
			name:        'student_eligibility_checklist'
			status:      'done'
			public_path: 'docs/ELIGIBILITY_STUDENT_CHECKLIST.md'
			private_ref: 'Student partner must provide private proof'
		},
		EvidenceSlot{
			name:        'v_readiness_report'
			status:      'done'
			public_path: 'evidence/readiness_report.json'
			private_ref: 'C:\\git\\v_projects\\usaii_global_ai_hackathon'
		},
		EvidenceSlot{
			name:        'vue_demo_mvp'
			status:      'done'
			public_path: 'evidence/web_demo_receipt.json'
			private_ref: 'C:\\git\\websites\\usaii_global_ai_hackathon'
		},
		EvidenceSlot{
			name:        'devpost_submission_packet'
			status:      'ready_for_authorized_session'
			public_path: 'submission/devpost_payload.json'
			private_ref: 'Devpost account session and qualifier code required'
		},
		EvidenceSlot{
			name:        'submission_automation'
			status:      'ready_for_authorized_session'
			public_path: 'automation/waiba'
			private_ref: 'WAIBAv Devpost and qualifier draft workflows'
		},
	]
}

fn usaii_integrations() []Integration {
	return [
		Integration{
			kind:     'vlang'
			name:     'Study-to-work scoring, plan generation, and evidence checks'
			status:   'done'
			evidence: 'C:\\git\\v_projects\\usaii_global_ai_hackathon'
		},
		Integration{
			kind:     'vue3_cdn_sfc_unocss'
			name:     'Interactive student coach demo for judge walkthrough'
			status:   'done'
			evidence: 'C:\\git\\websites\\usaii_global_ai_hackathon'
		},
		Integration{
			kind:     'waibav'
			name:     'Qualifier and Devpost draft preparation with final-submit gate'
			status:   'ready_for_authorized_session'
			evidence: 'automation/waiba'
		},
		Integration{
			kind:     'contestops_ai'
			name:     'Reusable challenge manifest, scorecard, and evidence renderers'
			status:   'done'
			evidence: 'C:\\git\\v_projects\\contestops_ai'
		},
	]
}

fn usaii_scorecard() JudgeScorecard {
	dimensions := [
		ScoreDimension{
			id:       'problem_understanding'
			label:    'Problem Understanding'
			score:    96
			weight:   20
			evidence: 'Career readiness, learning path, and portfolio gaps are specific to student users.'
			gap:      'Replace synthetic personas with the student team lead and two peer interviews.'
		},
		ScoreDimension{
			id:       'ai_analytics_reasoning'
			label:    'AI/Analytics Reasoning'
			score:    94
			weight:   30
			evidence: 'The system uses preference extraction, skill-gap scoring, rubric planning, and explainable recommendations.'
			gap:      'Add a small evaluation set during build week to compare baseline vs guarded recommendations.'
		},
		ScoreDimension{
			id:       'solution_architecture'
			label:    'Solution Design & Architecture'
			score:    95
			weight:   25
			evidence: 'V core, Vue demo, human approval gates, and synthetic-data disclosures.'
			gap:      'Wire final build-week model call or local rules engine evidence into the demo.'
		},
		ScoreDimension{
			id:       'impact_decision_value'
			label:    'Impact & Decision Value'
			score:    93
			weight:   15
			evidence: 'The demo converts interests into a week-by-week plan, portfolio artifact, and opportunity match.'
			gap:      'Capture a before/after student decision log during the hackathon.'
		},
		ScoreDimension{
			id:       'responsible_ai'
			label:    'Responsible AI & Ethics'
			score:    98
			weight:   10
			evidence: 'Human-in-loop, bias checks, privacy boundary, over-reliance warnings, and transparent scoring.'
			gap:      'Student team must confirm final wording and consent policy.'
		},
	]
	return JudgeScorecard{
		project_name: 'AI Study-to-Work Coach'
		overall:      weighted_score(dimensions)
		dimensions:   dimensions
		competitors:  usaii_competitors()
		next_moves:   usaii_next_moves()
	}
}

fn usaii_competitors() []CompetitorArchetype {
	return [
		CompetitorArchetype{
			name:     'Generic career chatbot'
			strength: 'Easy to understand and fast to demo.'
			weakness: 'Often gives shallow advice without evidence, rubric, or portfolio output.'
			counter:  'Show structured learning-to-work artifacts and human approval gates.'
			threat:   78
		},
		CompetitorArchetype{
			name:     'Resume or portfolio generator'
			strength: 'Clear output and student value.'
			weakness: 'Starts too late after the student already knows what to build.'
			counter:  'Own the earlier decision: what to learn, why, and what proof to create.'
			threat:   74
		},
		CompetitorArchetype{
			name:     'No-code AI workflow'
			strength: 'Polished demo in limited time.'
			weakness: 'May lack architecture clarity and responsible AI substance.'
			counter:  'Pair a simple user experience with inspectable V scoring and data disclosures.'
			threat:   70
		},
	]
}

fn usaii_next_moves() []string {
	return [
		'Confirm 2-5 eligible students and register every member individually on Devpost before June 6.',
		'Use the qualifier template for one 30-minute team rehearsal before June 7.',
		'During June 14-21, rebuild substantial competitive pieces from the prepared architecture and disclose AI assistance.',
		'Record a 3-5 minute video that shows one student moving from goals to plan, portfolio artifact, and human-approved next step.',
		'Run the WAIBAv draft flow only from an authorized team session with the qualifier code available.',
	]
}

fn usaii_proof_sprint() ProofSprint {
	return ProofSprint{
		name:           'USAII qualifier-to-hackathon proof sprint'
		window:         '2026-05-30 to 2026-06-21'
		objective:      'Prepare an eligible student team to qualify, build within the official window, and submit a responsible AI demo with evidence-backed Devpost artifacts.'
		metrics:        usaii_proof_metrics()
		steps:          usaii_proof_steps()
		win_conditions: [
			'Every team member is an eligible student and individually registered on Devpost.',
			'The team passes the AI Readiness Qualifier and preserves the approval code.',
			'Substantial hackathon work is recreated during June 14-21 with attribution.',
			'Final submission includes architecture, human-in-loop design, responsible AI guardrails, tools/data disclosure, video, and demo.',
			'No private student, school, tax, or age-verification evidence is committed to the public package.',
		]
	}
}

fn usaii_proof_metrics() []ProofMetric {
	return [
		ProofMetric{
			id:       'eligible_students'
			label:    'Eligible student team members'
			target:   2
			current:  0
			status:   'student_partner_required'
			evidence: 'docs/ELIGIBILITY_STUDENT_CHECKLIST.md'
		},
		ProofMetric{
			id:       'qualifier_rehearsal'
			label:    'Qualifier rehearsal'
			target:   1
			current:  1
			status:   'ready'
			evidence: 'submission/qualifier_response_template.md'
		},
		ProofMetric{
			id:       'demo_mvp'
			label:    'Demo MVP'
			target:   1
			current:  1
			status:   'done'
			evidence: 'C:\\git\\websites\\usaii_global_ai_hackathon'
		},
		ProofMetric{
			id:       'automation_playbooks'
			label:    'Submission automation playbooks'
			target:   2
			current:  2
			status:   'ready_for_authorized_session'
			evidence: 'automation/waiba'
		},
	]
}

fn usaii_proof_steps() []ProofSprintStep {
	return [
		ProofSprintStep{
			day:    'D0'
			title:  'Freeze pre-hackathon package and eligibility gates'
			owner:  'ops'
			output: 'Rules, package, MVP, and no-private-data evidence'
			status: 'done'
		},
		ProofSprintStep{
			day:    'June 6'
			title:  'Complete Devpost team registration'
			owner:  'student lead'
			output: 'Registered team and teammate emails'
			status: 'student_partner_required'
		},
		ProofSprintStep{
			day:    'June 7-10'
			title:  'Complete AI Readiness Qualifier'
			owner:  'student team'
			output: 'Approval code and result email'
			status: 'ready_for_authorized_session'
		},
		ProofSprintStep{
			day:    'June 14-20'
			title:  'Build official demo inside the hackathon window'
			owner:  'student team'
			output: 'Attributable code, demo, architecture, and responsible AI statement'
			status: 'scheduled'
		},
		ProofSprintStep{
			day:    'June 21'
			title:  'Run Devpost draft automation and submit before 11:59 PM ET'
			owner:  'student lead'
			output: 'Devpost confirmation receipt'
			status: 'ready_for_authorized_session'
		},
	]
}
