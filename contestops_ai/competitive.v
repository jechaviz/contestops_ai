module contestops_ai

pub fn default_scorecard() JudgeScorecard {
	dimensions := [
		ScoreDimension{
			id:       'business_viability'
			label:    'Business Viability'
			score:    58
			weight:   35
			evidence: 'sales/paid_pilot_offer.md and revenue ledger template'
			gap:      'Replace TBD revenue with arms-length paid pilots.'
		},
		ScoreDimension{
			id:       'ai_native_operations'
			label:    'AI-Native Operations'
			score:    86
			weight:   35
			evidence: 'V CLI, Gemini provider, WAIBAv traces, VImport scrape'
			gap:      'Run env-backed Gemini and Cloud receipts in production.'
		},
		ScoreDimension{
			id:       'category_impact'
			label:    'Category Impact'
			score:    82
			weight:   20
			evidence: 'founder operations workflow and paid pilot package'
			gap:      'Show user outcomes: hours saved, submissions shipped, jobs enabled.'
		},
		ScoreDimension{
			id:       'differentiation'
			label:    'Differentiation'
			score:    88
			weight:   10
			evidence: 'evidence ledger, form maps, automated receipts'
			gap:      'Make one customer case study public and redacted.'
		},
	]
	return JudgeScorecard{
		project_name: 'ContestOps AI'
		overall:      weighted_score(dimensions)
		dimensions:   dimensions
		competitors:  default_competitors()
		next_moves:   default_next_moves()
	}
}

pub fn raise_scorecard() JudgeScorecard {
	dimensions := [
		ScoreDimension{
			id:       'team_strength'
			label:    'Team Strength'
			score:    72
			weight:   20
			evidence: 'docs/ELIGIBILITY_CHECKLIST.md and secure founder profiles'
			gap:      'Add two named founder profiles, commitment, and Paris attendance.'
		},
		ScoreDimension{
			id:       'product_distinctiveness'
			label:    'Product Distinctiveness'
			score:    91
			weight:   25
			evidence: 'docs/COMPETITIVE_BATTLECARD.md and demo panel'
			gap:      'Show a live user-selected opportunity run in the video.'
		},
		ScoreDimension{
			id:       'traction_validation'
			label:    'Traction Or Validation'
			score:    68
			weight:   25
			evidence: 'docs/TRACTION_PROOF_MINIMUM.md'
			gap:      'Collect five conversations, two written validations, and one paid or LOI signal.'
		},
		ScoreDimension{
			id:       'opportunity_scale'
			label:    'Opportunity Scale'
			score:    90
			weight:   15
			evidence: 'docs/JUDGING_SCORECARD.md'
			gap:      'Quantify reachable wedge: founders, accelerators, grants, hackathons, and RFPs.'
		},
		ScoreDimension{
			id:       'ai_depth'
			label:    'AI Depth'
			score:    88
			weight:   10
			evidence: 'V core, scorecard renderer, generated payloads, WAIBAv traces'
			gap:      'Capture one env-backed model call and one live automation draft session.'
		},
		ScoreDimension{
			id:       'application_completeness'
			label:    'Application Completeness'
			score:    94
			weight:   5
			evidence: 'submission/dealum_payload.json and submission/dealum_form_map.yml'
			gap:      'Replace secure_input_required placeholders inside Dealum.'
		},
	]
	return JudgeScorecard{
		project_name: 'ContestOps AI'
		overall:      weighted_score(dimensions)
		dimensions:   dimensions
		competitors:  raise_competitors()
		next_moves:   raise_next_moves()
	}
}

fn raise_competitors() []CompetitorArchetype {
	return [
		CompetitorArchetype{
			name:     'Startup portals'
			strength: 'Distribution, profiles, program discovery, investor workflows.'
			weakness: 'They collect applications; they do not build the evidence package for founders.'
			counter:  'Complement Dealum/F6S by preparing the founder to submit stronger applications everywhere.'
			threat:   78
		},
		CompetitorArchetype{
			name:     'Grant and RFP platforms'
			strength: 'Clear ROI, proposal workflows, compliance matrices, buyer budget.'
			weakness: 'Often narrow to grants or enterprise proposals, not founder opportunity execution.'
			counter:  'Own the broader founder application-ops wedge: contests, accelerators, grants, RFPs, and MVP evidence.'
			threat:   86
		},
		CompetitorArchetype{
			name:     'Proposal writers'
			strength: 'Fast drafting and easy before/after demo.'
			weakness: 'Writing is only one artifact; judges need product, traction, media, forms, and receipts.'
			counter:  'Show the full lifecycle from source to payload to automation receipt.'
			threat:   74
		},
		CompetitorArchetype{
			name:     'Generic browser agents'
			strength: 'Broad automation narrative and impressive demos.'
			weakness: 'Weak domain memory, risky claims, and little judging/evidence structure.'
			counter:  'Use domain-specific scoring, private/public evidence boundaries, and final-submit gates.'
			threat:   82
		},
		CompetitorArchetype{
			name:     'Consultants and agencies'
			strength: 'Trust, expertise, and white-glove review.'
			weakness: 'Manual, hard to scale, inconsistent receipts.'
			counter:  'Productize repeatable execution and leave experts for final judgment.'
			threat:   70
		},
	]
}

fn raise_next_moves() []string {
	return [
		'Run a 72-hour proof sprint with 20 targets, 5 conversations, 2 validations, and 1 paid or LOI signal.',
		'Record a judge-demo video that starts with the RAISE deadline and ends with Dealum payload readiness.',
		'Generate one packet for a user-selected opportunity to prove this is not hand-authored for RAISE.',
		'Publish redacted before/after time saved and missing-evidence detection metrics.',
		'Add founder legal/team/funding secure inputs directly in Dealum before final submit.',
	]
}

fn default_competitors() []CompetitorArchetype {
	return [
		CompetitorArchetype{
			name:     'Vertical AI business with early revenue'
			strength: 'Clear customer pain, simple demo, stronger sales proof.'
			weakness: 'Often shallow on agent operations and evidence depth.'
			counter:  'Win by showing AI runs the business, not only the product feature.'
			threat:   92
		},
		CompetitorArchetype{
			name:     'Generic agent platform'
			strength: 'Broad demos, polished agent narrative, Google Cloud alignment.'
			weakness: 'Hard to prove a focused business wedge and real users.'
			counter:  'Show founder operations niche, paid pilots, and repeatable packages.'
			threat:   84
		},
		CompetitorArchetype{
			name:     'Proposal or grant-writing assistant'
			strength: 'Obvious workflow and buyer; easy narrative.'
			weakness: 'Mostly writing, weaker automation and audit trail.'
			counter:  'Position as execution/evidence/submission ops beyond drafting.'
			threat:   78
		},
		CompetitorArchetype{
			name:     'AI devtool or coding startup'
			strength: 'Developers understand it; strong technical demos.'
			weakness: 'Crowded category and weaker job-creation story.'
			counter:  'Show economic opportunity creation for nontechnical founders.'
			threat:   76
		},
	]
}

fn default_next_moves() []string {
	return [
		'Close 3 arms-length paid pilots before 2026-06-15.',
		'Deploy V API to Cloud Run and capture Cloud Logging receipts.',
		'Run one env-backed Gemini call per production package and store redacted receipts.',
		'Publish 3 redacted case studies with before/after time saved.',
		'Record 2:45 video centered on AI operating the business end to end.',
	]
}

fn weighted_score(dimensions []ScoreDimension) int {
	mut weighted := 0
	mut total := 0
	for dimension in dimensions {
		weighted += dimension.score * dimension.weight
		total += dimension.weight
	}
	if total == 0 {
		return 0
	}
	return weighted / total
}
