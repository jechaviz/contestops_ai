module contestops_ai

pub fn wfp_sdg2_manifest() PackageManifest {
	return PackageManifest{
		project_name:  'Food Risk Signal Desk'
		version:       '1.0.0'
		category:      'WFP Innovation Challenge SDG2 / impact_grants'
		deadline:      'Rolling WFP Innovation Challenge review; verify active cohort before submit'
		prod_score:    100
		rules:         wfp_sdg2_rules()
		milestones:    wfp_sdg2_milestones()
		evidence:      wfp_sdg2_evidence()
		integrations:  wfp_sdg2_integrations()
		scorecard:     wfp_sdg2_scorecard()
		proof_sprint:  wfp_sdg2_proof_sprint()
		founder_proof: default_founder_proof()
	}
}

fn wfp_sdg2_rules() []RuleItem {
	return [
		RuleItem{
			id:       'legal_entity'
			title:    'Applicant is an established legal entity or can apply through an eligible partner.'
			status:   'secure_input_required'
			evidence: 'submission/wfp_form_map.yml'
		},
		RuleItem{
			id:       'mvp_stage'
			title:    'MVP demonstrates food-risk ingestion, scoring, forecast, and field action queues.'
			status:   'done'
			evidence: 'C:\\git\\v_projects\\wfp_innovation_challenge_sdg2'
		},
		RuleItem{
			id:       'wfp_country_presence'
			title:    'Six-month Sprint plan targets WFP-operating countries with partner presence readiness.'
			status:   'done'
			evidence: 'docs/pilot_plan.md'
		},
		RuleItem{
			id:       'impact_and_scale'
			title:    'Impact model ties SDG2 outcomes to earlier action, supply reliability, and resilience.'
			status:   'done'
			evidence: 'docs/impact_metrics.md'
		},
		RuleItem{
			id:       'financial_sustainability'
			title:    'Scale plan explains service, government, NGO, and donor continuation after WFP funding.'
			status:   'done'
			evidence: 'docs/one_pager.md'
		},
		RuleItem{
			id:       'external_form_automation'
			title:    'Airtable application draft-fill runbook is prepared with authorized final-submit gate.'
			status:   'ready_for_authorized_session'
			evidence: 'automation/wfp_airtable_submission_runbook.md'
		},
	]
}

fn wfp_sdg2_milestones() []Milestone {
	return [
		Milestone{
			version: '0.1.0'
			title:   'Official challenge fit and ecosystem audit'
			target:  '2026-05-30'
			status:  'done'
		},
		Milestone{
			version: '0.3.0'
			title:   'Data-source model and sample food-risk signals'
			target:  '2026-05-30'
			status:  'done'
		},
		Milestone{
			version: '0.6.0'
			title:   'V ETL, scoring, forecast, CLI, and backend MVP'
			target:  '2026-05-30'
			status:  'done'
		},
		Milestone{
			version: '0.8.0'
			title:   'Vue signal desk, pilot plan, and metrics package'
			target:  '2026-05-30'
			status:  'done'
		},
		Milestone{
			version: '1.0.0'
			title:   'Application-ready WFP submission packet'
			target:  '2026-05-30'
			status:  'done'
		},
	]
}

fn wfp_sdg2_evidence() []EvidenceSlot {
	return [
		EvidenceSlot{
			name:        'official_wfp_sources'
			status:      'done'
			public_path: 'docs/sources.md'
			private_ref: 'WFP Innovation Challenge and Apply pages'
		},
		EvidenceSlot{
			name:        'food_risk_mvp'
			status:      'done'
			public_path: 'evidence/food_risk_snapshot.json'
			private_ref: 'C:\\git\\v_projects\\wfp_innovation_challenge_sdg2'
		},
		EvidenceSlot{
			name:        'signal_desk_dashboard'
			status:      'done'
			public_path: 'evidence/web_demo_receipt.json'
			private_ref: 'C:\\git\\websites\\wfp_innovation_challenge_sdg2'
		},
		EvidenceSlot{
			name:        'application_draft'
			status:      'done'
			public_path: 'application/application_draft.md'
			private_ref: 'Airtable final fields require live browser validation'
		},
		EvidenceSlot{
			name:        'submission_automation'
			status:      'ready_for_authorized_session'
			public_path: 'automation/wfp_airtable_submission_runbook.md'
			private_ref: 'Authorized Airtable operator session'
		},
	]
}

fn wfp_sdg2_integrations() []Integration {
	return [
		Integration{
			kind:     'vlang'
			name:     'ETL, scoring, forecast, CLI, and local backend'
			status:   'done'
			evidence: 'C:\\git\\v_projects\\wfp_innovation_challenge_sdg2'
		},
		Integration{
			kind:     'vue3_cdn_sfc_unocss'
			name:     'Food Risk Signal Desk judge and partner dashboard'
			status:   'done'
			evidence: 'C:\\git\\websites\\wfp_innovation_challenge_sdg2'
		},
		Integration{
			kind:     'wfp_hungermap_data'
			name:     'HungerMap IPC, country, conflict, hazard, and report endpoints'
			status:   'done'
			evidence: 'docs/data_sources.md'
		},
		Integration{
			kind:     'waibav'
			name:     'Authorized Airtable draft preparation and receipt capture'
			status:   'ready_for_authorized_session'
			evidence: 'automation/wfp_airtable_submission_runbook.md'
		},
		Integration{
			kind:     'contestops_ai'
			name:     'Reusable WFP Challenge manifest and evidence renderers'
			status:   'done'
			evidence: 'C:\\git\\v_projects\\contestops_ai'
		},
	]
}

fn wfp_sdg2_scorecard() JudgeScorecard {
	dimensions := [
		ScoreDimension{
			id:       'impact_scale'
			label:    'Impact and Scale'
			score:    100
			weight:   30
			evidence: 'Risk scoring maps food-insecurity pressure into earlier action and scale metrics.'
			gap:      'Replace synthetic pilot baseline with partner country data before final submit.'
		},
		ScoreDimension{
			id:       'feasibility'
			label:    'Feasibility'
			score:    98
			weight:   25
			evidence: 'V CLI/backend and Vue dashboard run from local artifacts with open data adapters.'
			gap:      'Validate live Airtable fields and deploy endpoint after partner identity is known.'
		},
		ScoreDimension{
			id:       'innovation'
			label:    'Innovation'
			score:    96
			weight:   20
			evidence: 'Combines HungerMap-style indicators with field-ready action queues and evidence packs.'
			gap:      'Add one partner quote or field-user interview.'
		},
		ScoreDimension{
			id:       'financial_sustainability'
			label:    'Financial Sustainability'
			score:    94
			weight:   15
			evidence: 'Donor, government, NGO, and analytics-service continuation paths are documented.'
			gap:      'Attach price or co-funding assumptions for a named geography.'
		},
		ScoreDimension{
			id:       'team'
			label:    'Team'
			score:    94
			weight:   10
			evidence: 'Founder proof names automation, data, integrations, and local agent ecosystem.'
			gap:      'Insert legal applicant team and country partner before official submit.'
		},
	]
	return JudgeScorecard{
		project_name: 'Food Risk Signal Desk'
		overall:      weighted_score(dimensions)
		dimensions:   dimensions
		competitors:  wfp_sdg2_competitors()
		next_moves:   wfp_sdg2_next_moves()
	}
}

fn wfp_sdg2_competitors() []CompetitorArchetype {
	return [
		CompetitorArchetype{
			name:     'Generic food-security dashboard'
			strength: 'Clear visual monitoring story.'
			weakness: 'Often stops at awareness without field action, receipts, or Sprint plan.'
			counter:  'Show action queues, pilot metrics, and application-ready evidence.'
			threat:   82
		},
		CompetitorArchetype{
			name:     'Research-heavy early warning model'
			strength: 'Strong methodology and predictive claims.'
			weakness: 'Can be hard to deploy with country offices in six months.'
			counter:  'Emphasize MVP pragmatism, open data, explainable scoring, and partner workflow.'
			threat:   78
		},
		CompetitorArchetype{
			name:     'Logistics optimization tool'
			strength: 'Direct WFP supply-chain fit.'
			weakness: 'May not capture upstream food-security pressure and local coping signals.'
			counter:  'Position as pre-logistics signal layer feeding preparedness and supply choices.'
			threat:   75
		},
	]
}

fn wfp_sdg2_next_moves() []string {
	return [
		'Validate one implementation country with a WFP office, NGO, or local food-security partner.',
		'Run live HungerMap endpoint ingestion and store a redacted receipt.',
		'Replace synthetic pilot rows with partner-approved baseline rows.',
		'Open the Airtable form in an authorized session, validate field labels, and save a draft.',
		'Attach legal-entity, team, and partner-presence facts before final submit.',
	]
}

fn wfp_sdg2_proof_sprint() ProofSprint {
	return ProofSprint{
		name:           'WFP SDG2 Food Risk proof sprint'
		window:         '2026-05-30 to rolling application submit'
		objective:      'Move from demo-ready signal desk to partner-validated six-month Sprint proposal for WFP Innovation Challenge review.'
		metrics:        [
			ProofMetric{
				id:       'open_data_sources'
				label:    'Open data source adapters'
				target:   5
				current:  5
				status:   'done'
				evidence: 'docs/data_sources.md'
			},
			ProofMetric{
				id:       'pilot_sites'
				label:    'Pilot sites in signal desk'
				target:   8
				current:  8
				status:   'done'
				evidence: 'evidence/food_risk_snapshot.json'
			},
			ProofMetric{
				id:       'partner_validation'
				label:    'Partner validation interviews'
				target:   3
				current:  0
				status:   'partner_required'
				evidence: 'docs/pilot_plan.md'
			},
			ProofMetric{
				id:       'submission_dry_run'
				label:    'Airtable submission dry-run'
				target:   1
				current:  0
				status:   'ready_for_authorized_session'
				evidence: 'automation/wfp_airtable_submission_runbook.md'
			},
		]
		steps:          [
			ProofSprintStep{
				day:    'D0'
				title:  'Freeze MVP, data sources, and application packet'
				owner:  'product'
				output: 'V exports, Vue demo, one-pager, checklist, application draft'
				status: 'done'
			},
			ProofSprintStep{
				day:    'D1-D3'
				title:  'Partner and country validation'
				owner:  'field partnerships'
				output: 'Country, user quote, baseline, legal applicant facts'
				status: 'partner_required'
			},
			ProofSprintStep{
				day:    'D4'
				title:  'Authorized Airtable draft-fill'
				owner:  'operator'
				output: 'Saved draft or submission receipt'
				status: 'ready_for_authorized_session'
			},
		]
		win_conditions: [
			'The submitted narrative maps directly to WFP impact, feasibility, innovation, sustainability, and team criteria.',
			'No credential, personal legal data, or private partner evidence is committed.',
			'Every quantitative claim points to a source, demo artifact, or partner-approved baseline.',
			'Final Airtable submit is executed only from an authorized applicant session.',
		]
	}
}
