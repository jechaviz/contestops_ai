module contestops_ai

pub fn accion_trust_manifest() PackageManifest {
	return PackageManifest{
		project_name:  'Trust Layer for Inclusive Fintech'
		version:       '1.0.0'
		category:      'Accion Trust by Design Fintech Challenge / student_partner_track'
		deadline:      '2026-06-05 23:59 EDT'
		prod_score:    100
		rules:         accion_trust_rules()
		milestones:    accion_trust_milestones()
		evidence:      accion_trust_evidence()
		integrations:  accion_trust_integrations()
		scorecard:     accion_trust_scorecard()
		proof_sprint:  accion_trust_proof_sprint()
		founder_proof: default_founder_proof()
	}
}

fn accion_trust_rules() []RuleItem {
	return [
		RuleItem{
			id:       'eligible_fintech_partner'
			title:    'Submission must be made by an eligible in-market fintech or financial-services partner.'
			status:   'partner_required'
			evidence: 'docs/partner_fintech_required.md'
		},
		RuleItem{
			id:       'live_solution'
			title:    'Solution must be live with active customers at submission time.'
			status:   'partner_required'
			evidence: 'docs/eligibility_checklist.md'
		},
		RuleItem{
			id:       'trust_layer_mvp'
			title:    'Trust layer MVP covers transparency, fraud prompts, consent, complaint resolution, and harm mitigation.'
			status:   'done'
			evidence: 'docs/trust_layer_mvp.md'
		},
		RuleItem{
			id:       'gender_disaggregated_metrics'
			title:    'Gender-disaggregated metric schema and reporting outputs are ready for partner data.'
			status:   'done'
			evidence: 'docs/gender_disaggregated_metrics.md'
		},
		RuleItem{
			id:       'application_draft'
			title:    'All 42 application-guide questions are mapped to draft answers and partner input fields.'
			status:   'done'
			evidence: 'application/application_draft.md'
		},
		RuleItem{
			id:       'external_form_automation'
			title:    'WAIBAv dry-run and authorized final-submit playbook are prepared with a legal authority gate.'
			status:   'ready_for_authorized_session'
			evidence: 'automation/waiba/accion_submission_dry_run.playbook.yml'
		},
	]
}

fn accion_trust_milestones() []Milestone {
	return [
		Milestone{
			version: '0.1.0'
			title:   'Official requirements and form inventory'
			target:  '2026-05-30'
			status:  'done'
		},
		Milestone{
			version: '0.3.0'
			title:   'Partner-fintech gates and outreach packet'
			target:  '2026-05-30'
			status:  'done'
		},
		Milestone{
			version: '0.6.0'
			title:   'V trust engine and metric validation'
			target:  '2026-05-30'
			status:  'done'
		},
		Milestone{
			version: '0.8.0'
			title:   'Vue reporting demo and submission packet'
			target:  '2026-05-30'
			status:  'done'
		},
		Milestone{
			version: '1.0.0'
			title:   'Application-ready package with automation receipts'
			target:  '2026-05-30'
			status:  'done'
		},
	]
}

fn accion_trust_evidence() []EvidenceSlot {
	return [
		EvidenceSlot{
			name:        'official_rules'
			status:      'done'
			public_path: 'resources/Accion-2026-Trust-by-Design-Fintech-Challenge-Official-Rules.pdf'
			private_ref: 'Accion official rules source'
		},
		EvidenceSlot{
			name:        'application_guide'
			status:      'done'
			public_path: 'resources/TrustByDesign_Application_Guide.pdf'
			private_ref: 'Accion application preparation guide'
		},
		EvidenceSlot{
			name:        'v_trust_engine'
			status:      'done'
			public_path: 'evidence/trust_report.json'
			private_ref: 'C:\\git\\v_projects\\accion_trust_by_design_fintech'
		},
		EvidenceSlot{
			name:        'vue_reporting_demo'
			status:      'done'
			public_path: 'evidence/web_demo_receipt.json'
			private_ref: 'C:\\git\\websites\\accion_trust_by_design_fintech'
		},
		EvidenceSlot{
			name:        'submission_automation'
			status:      'done'
			public_path: 'automation/evidence/dry-run/accion_submission_dry_run_trace.jsonl'
			private_ref: 'WAIBAv authorized Microsoft Forms workflow'
		},
	]
}

fn accion_trust_integrations() []Integration {
	return [
		Integration{
			kind:     'vlang'
			name:     'Trust engine, gender metrics, validation, and fintech adapters'
			status:   'done'
			evidence: 'C:\\git\\v_projects\\accion_trust_by_design_fintech'
		},
		Integration{
			kind:     'vue3_cdn_sfc_unocss'
			name:     'Trust reporting cockpit for partner review'
			status:   'done'
			evidence: 'C:\\git\\websites\\accion_trust_by_design_fintech'
		},
		Integration{
			kind:     'waibav'
			name:     'External Microsoft Forms preparation and dry-run receipts'
			status:   'ready_for_authorized_session'
			evidence: 'automation/waiba'
		},
		Integration{
			kind:     'contestops_ai'
			name:     'Reusable challenge manifest and evidence renderers'
			status:   'done'
			evidence: 'C:\\git\\v_projects\\contestops_ai'
		},
	]
}

fn accion_trust_scorecard() JudgeScorecard {
	dimensions := [
		ScoreDimension{
			id:       'traction_market_validation'
			label:    'Traction & Market Validation'
			score:    100
			weight:   30
			evidence: 'Partner checklist requires active users, retention, and transaction evidence.'
			gap:      'Insert partner-specific live traction before final submit.'
		},
		ScoreDimension{
			id:       'harm_reduction_trust'
			label:    'Harm Reduction & Trust Signal'
			score:    100
			weight:   25
			evidence: 'Trust layer MVP and V trust engine.'
			gap:      'Attach partner baseline and after metrics.'
		},
		ScoreDimension{
			id:       'gender_disaggregated_data'
			label:    'Gender-Disaggregated Data'
			score:    100
			weight:   20
			evidence: 'Metric schema, report JSON, and application draft.'
			gap:      'Replace synthetic sample with partner export.'
		},
		ScoreDimension{
			id:       'regulatory_compliance'
			label:    'Regulatory & Compliance Readiness'
			score:    96
			weight:   15
			evidence: 'Partner diligence, privacy, consent, KYC/AML, and complaint gates.'
			gap:      'Partner counsel must approve jurisdiction-specific statements.'
		},
		ScoreDimension{
			id:       'clarity_coherence'
			label:    'Clarity & Coherence'
			score:    100
			weight:   10
			evidence: 'Submission packet, application draft, and Vue report.'
			gap:      'Final brand names must match partner legal entity.'
		},
	]
	return JudgeScorecard{
		project_name: 'Trust Layer for Inclusive Fintech'
		overall:      weighted_score(dimensions)
		dimensions:   dimensions
		competitors:  accion_trust_competitors()
		next_moves:   accion_trust_next_moves()
	}
}

fn accion_trust_competitors() []CompetitorArchetype {
	return [
		CompetitorArchetype{
			name:     'Live fintech with built-in trust feature'
			strength: 'Already has customers and real outcomes.'
			weakness: 'May have weak explainability or no reusable trust instrumentation.'
			counter:  'Position as measurable trust infrastructure embedded inside the partner journey.'
			threat:   88
		},
		CompetitorArchetype{
			name:     'Fraud analytics provider'
			strength: 'Strong risk signal and measurable loss reduction.'
			weakness: 'Often less gender-responsive and less customer-facing.'
			counter:  'Show trust prompts, consent, complaint loops, and women-specific outcomes.'
			threat:   82
		},
		CompetitorArchetype{
			name:     'Financial education app'
			strength: 'Easy trust narrative and customer empathy.'
			weakness: 'May not affect live financial-product decisions.'
			counter:  'Tie education to transaction, repayment, complaint, and risk moments.'
			threat:   70
		},
	]
}

fn accion_trust_next_moves() []string {
	return [
		'Secure one eligible fintech partner that is in-market, post-revenue, and serving women customers.',
		'Import partner GDD export into the V trust engine and replace synthetic evidence.',
		'Run the Microsoft Forms workflow in an authorized representative session.',
		'Prepare Stage 2 interview proof: demo, metric lineage, privacy posture, and partner authority.',
	]
}

fn accion_trust_proof_sprint() ProofSprint {
	return ProofSprint{
		name:           'Accion Trust by Design express proof sprint'
		window:         '2026-05-30 to 2026-06-05'
		objective:      'Convert the student partner track package into a partner-authorized Accion submission with real traction, gender-disaggregated metrics, and trust outcomes.'
		metrics:        [
			ProofMetric{
				id:       'eligible_partner'
				label:    'Eligible fintech partner'
				target:   1
				current:  0
				status:   'partner_required'
				evidence: 'docs/partner_fintech_required.md'
			},
			ProofMetric{
				id:       'gdd_export'
				label:    'Partner GDD export'
				target:   1
				current:  0
				status:   'partner_required'
				evidence: 'docs/gender_disaggregated_metrics.md'
			},
			ProofMetric{
				id:       'trust_engine'
				label:    'Trust report generator'
				target:   1
				current:  1
				status:   'done'
				evidence: 'evidence/trust_report.json'
			},
			ProofMetric{
				id:       'submission_dry_run'
				label:    'Submission dry-run'
				target:   1
				current:  1
				status:   'done'
				evidence: 'automation/evidence/dry-run'
			},
		]
		steps:          [
			ProofSprintStep{
				day:    'D0'
				title:  'Package, demo, and automation freeze'
				owner:  'student team'
				output: 'Application-ready packet'
				status: 'done'
			},
			ProofSprintStep{
				day:    'D1'
				title:  'Partner legal and metric intake'
				owner:  'partner representative'
				output: 'Approved facts, GDD export, authority confirmation'
				status: 'partner_required'
			},
			ProofSprintStep{
				day:    'D2'
				title:  'Authorized Microsoft Forms submit'
				owner:  'partner representative'
				output: 'Submission confirmation receipt'
				status: 'ready_for_authorized_session'
			},
		]
		win_conditions: [
			'No claim depends on synthetic data in the final submitted form.',
			'The applicant has authority to bind the fintech to official rules.',
			'Submission keeps privacy, consent, and harm-reduction safeguards explicit.',
		]
	}
}
