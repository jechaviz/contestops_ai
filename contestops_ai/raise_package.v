module contestops_ai

pub fn raise_manifest() PackageManifest {
	return PackageManifest{
		project_name:  'ContestOps AI'
		version:       '0.2.0'
		category:      'AI startup pitch'
		deadline:      '2026-06-10'
		prod_score:    72
		rules:         raise_rules()
		milestones:    raise_milestones()
		evidence:      raise_evidence()
		integrations:  raise_integrations()
		scorecard:     raise_scorecard()
		proof_sprint:  raise_proof_sprint()
		founder_proof: default_founder_proof()
	}
}

fn raise_rules() []RuleItem {
	return [
		RuleItem{
			id:       'ai_core'
			title:    'AI is core to the product, not an auxiliary feature.'
			status:   'active'
			evidence: 'docs/PRODUCT_AI_PROPOSED.md'
		},
		RuleItem{
			id:       'funding_cap'
			title:    'Total funding raised to date is below EUR 10M.'
			status:   'applicant_input'
			evidence: 'docs/ELIGIBILITY_CHECKLIST.md'
		},
		RuleItem{
			id:       'legal_entity'
			title:    'Company is a registered legal entity.'
			status:   'applicant_input'
			evidence: 'submission/dealum_payload.json'
		},
		RuleItem{
			id:       'team'
			title:    'Team has at least two members or two dedicated cofounders.'
			status:   'applicant_input'
			evidence: 'docs/ELIGIBILITY_CHECKLIST.md'
		},
		RuleItem{
			id:       'stage'
			title:    'Startup is pre-seed, seed, or Series A.'
			status:   'applicant_input'
			evidence: 'submission/dealum_payload.json'
		},
		RuleItem{
			id:       'live_product'
			title:    'Live product or strong MVP exists.'
			status:   'active'
			evidence: 'docs/PRODUCT_AI_PROPOSED.md'
		},
		RuleItem{
			id:       'traction'
			title:    'Early traction or strong validation is packaged.'
			status:   'planned'
			evidence: 'docs/TRACTION_PROOF_MINIMUM.md'
		},
		RuleItem{
			id:       'attendance'
			title:    'At least one founder can attend finals in Paris.'
			status:   'applicant_input'
			evidence: 'docs/ELIGIBILITY_CHECKLIST.md'
		},
		RuleItem{
			id:       'dealum'
			title:    'Dealum application payload and field map are ready.'
			status:   'active'
			evidence: 'submission/dealum_payload.json'
		},
	]
}

fn raise_milestones() []Milestone {
	return [
		Milestone{
			version: '0.1.0'
			title:   'Opportunity research and source lock'
			target:  '2026-05-29'
			status:  'done'
		},
		Milestone{
			version: '0.2.0'
			title:   'Application packet generator'
			target:  '2026-05-29'
			status:  'active'
		},
		Milestone{
			version: '0.4.0'
			title:   'Demo panel and evidence ledger'
			target:  '2026-05-30'
			status:  'planned'
		},
		Milestone{
			version: '0.7.0'
			title:   'Dealum draft automation'
			target:  '2026-05-31'
			status:  'planned'
		},
		Milestone{
			version: '0.9.0'
			title:   'Founder review and final media'
			target:  '2026-06-01'
			status:  'planned'
		},
		Milestone{
			version: '1.0.0'
			title:   'RAISE application submitted'
			target:  '2026-06-10'
			status:  'planned'
		},
	]
}

fn raise_evidence() []EvidenceSlot {
	return [
		EvidenceSlot{
			name:        'source_snapshot'
			status:      'active'
			public_path: 'evidence/source_snapshot.md'
			private_ref: 'official RAISE and VC4A pages'
		},
		EvidenceSlot{
			name:        'product_demo'
			status:      'active'
			public_path: 'docs/PRODUCT_AI_PROPOSED.md'
			private_ref: 'C:\\git\\websites\\raise_the_stakes_ai_startup_competition'
		},
		EvidenceSlot{
			name:        'traction_minimum'
			status:      'planned'
			public_path: 'docs/TRACTION_PROOF_MINIMUM.md'
			private_ref: 'evidence/private/traction'
		},
		EvidenceSlot{
			name:        'dealum_payload'
			status:      'active'
			public_path: 'submission/dealum_payload.json'
			private_ref: 'Dealum account profile'
		},
		EvidenceSlot{
			name:        'automation_receipts'
			status:      'active'
			public_path: 'automation/output'
			private_ref: 'WAIBAv browser session'
		},
	]
}

fn raise_integrations() []Integration {
	return [
		Integration{
			kind:     'dealum'
			name:     'RAISE application portal'
			status:   'mapped'
			evidence: 'submission/dealum_form_map.yml'
		},
		Integration{
			kind:     'waibav'
			name:     'External form draft and submission automation'
			status:   'active'
			evidence: 'automation/waiba'
		},
		Integration{
			kind:     'vue3_cdn'
			name:     'Founder-facing demo panel'
			status:   'active'
			evidence: 'C:\\git\\websites\\raise_the_stakes_ai_startup_competition'
		},
		Integration{
			kind:     'vlang'
			name:     'Application packet generator'
			status:   'active'
			evidence: 'C:\\git\\v_projects\\contestops_ai'
		},
	]
}
