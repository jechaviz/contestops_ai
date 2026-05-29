module contestops_ai

pub fn default_manifest() PackageManifest {
	return PackageManifest{
		project_name:  'ContestOps AI'
		version:       '0.5.0'
		category:      'Entrepreneurship & Job Creation'
		deadline:      '2026-08-17 13:00 PDT'
		prod_score:    86
		rules:         default_rules()
		milestones:    default_milestones()
		evidence:      default_evidence()
		integrations:  default_integrations()
		scorecard:     default_scorecard()
		proof_sprint:  default_proof_sprint()
		founder_proof: default_founder_proof()
	}
}

fn default_rules() []RuleItem {
	return [
		RuleItem{
			id:       'eligibility'
			title:    'Entrant meets individual/team/org eligibility and exclusions.'
			status:   'open'
			evidence: 'docs/RULES_CHECKLIST.md'
		},
		RuleItem{
			id:       'new_project'
			title:    'Project created after 2026-05-19 with reused code disclosed.'
			status:   'active'
			evidence: 'README.md and repo history'
		},
		RuleItem{
			id:       'gemini_api'
			title:    'At least one deployed LLM call uses the Gemini API.'
			status:   'active'
			evidence: 'evidence/gemini_call_receipts'
		},
		RuleItem{
			id:       'google_cloud'
			title:    'At least one Google Cloud product is used.'
			status:   'cloudrun_ready'
			evidence: 'deploy/cloudrun-service.yaml'
		},
		RuleItem{
			id:       'video'
			title:    'Public demo video is under three minutes.'
			status:   'planned'
			evidence: 'docs/DECK_VIDEO_OUTLINE.md'
		},
		RuleItem{
			id:       'repo'
			title:    'Repository is public or shared with Devpost judging addresses.'
			status:   'active'
			evidence: 'https://github.com/jechaviz/_contest'
		},
		RuleItem{
			id:       'revenue'
			title:    'Revenue, costs, marketing spend, and monthly breakdown are ready.'
			status:   'planned'
			evidence: 'evidence/evidence_ledger.md'
		},
		RuleItem{
			id:       'users'
			title:    'Real user evidence, breakdown, feedback, and consent are ready.'
			status:   'planned'
			evidence: 'evidence/evidence_ledger.md'
		},
		RuleItem{
			id:       'running_product'
			title:    'Agent logs, API records, dashboards, and execution receipts exist.'
			status:   'active'
			evidence: 'automation/output'
		},
	]
}

fn default_milestones() []Milestone {
	return [
		Milestone{
			version: '0.1.0'
			title:   'Foundation package'
			target:  '2026-05-29'
			status:  'active'
		},
		Milestone{
			version: '0.2.0'
			title:   'Gemini and Google Cloud smoke path'
			target:  '2026-06-04'
			status:  'planned'
		},
		Milestone{
			version: '0.3.0'
			title:   'MVP submission workflow'
			target:  '2026-06-12'
			status:  'planned'
		},
		Milestone{
			version: '0.5.0'
			title:   'Competitive proof sprint'
			target:  '2026-05-29'
			status:  'active'
		},
		Milestone{
			version: '0.7.0'
			title:   'Customer proof package'
			target:  '2026-07-13'
			status:  'planned'
		},
		Milestone{
			version: '0.9.0'
			title:   'Media and submission hardening'
			target:  '2026-07-27'
			status:  'planned'
		},
		Milestone{
			version: '1.0.0'
			title:   'Devpost production submission'
			target:  '2026-08-07'
			status:  'planned'
		},
	]
}

fn default_evidence() []EvidenceSlot {
	return [
		EvidenceSlot{
			name:        'manifest'
			status:      'active'
			public_path: 'evidence/public/manifest.json'
			private_ref: 'C:\\git\\v_projects\\contestops_ai\\out'
		},
		EvidenceSlot{
			name:        'gemini_call'
			status:      'active'
			public_path: 'evidence/public/gemini_receipt_redacted.json'
			private_ref: 'evidence/private/gemini'
		},
		EvidenceSlot{
			name:        'google_cloud_deploy'
			status:      'planned'
			public_path: 'evidence/public/cloud_run_redacted.md'
			private_ref: 'evidence/private/google_cloud'
		},
		EvidenceSlot{
			name:        'revenue_ledger'
			status:      'planned'
			public_path: 'evidence/evidence_ledger.md'
			private_ref: 'evidence/private/revenue'
		},
		EvidenceSlot{
			name:        'user_ledger'
			status:      'planned'
			public_path: 'evidence/evidence_ledger.md'
			private_ref: 'evidence/private/users'
		},
	]
}

fn default_integrations() []Integration {
	return [
		Integration{
			kind:     'gemini_api'
			name:     'Gemini planning and critique provider'
			status:   'implemented_mock_and_env'
			evidence: 'gemini-smoke command'
		},
		Integration{
			kind:     'google_cloud'
			name:     'Cloud Run, Cloud Logging, Cloud Storage'
			status:   'cloudrun_ready'
			evidence: 'Dockerfile and deploy/cloudrun-service.yaml'
		},
		Integration{
			kind:     'vimport'
			name:     'Opportunity ingestion and rule extraction'
			status:   'selected'
			evidence: 'C:\\git\\v_projects\\vimport'
		},
		Integration{
			kind:     'waibav'
			name:     'External form automation and evidence capture'
			status:   'active'
			evidence: 'automation\\waiba'
		},
		Integration{
			kind:     'vhub'
			name:     'Governed backend delivery connectors'
			status:   'selected'
			evidence: 'C:\\git\\v_projects\\vhub'
		},
	]
}
