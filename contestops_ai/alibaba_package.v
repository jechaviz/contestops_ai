module contestops_ai

pub fn alibaba_manifest() PackageManifest {
	return PackageManifest{
		project_name: 'Accio Commerce Copilot'
		version:      '1.0.0'
		category:     'AI startup pitch'
		deadline:     '2026 CoCreate Pitch cycle; exact form deadline requires live Accio Work validation'
		prod_score:   100
		rules:        alibaba_rules()
		milestones:   alibaba_milestones()
		evidence:     alibaba_evidence()
		integrations: alibaba_integrations()
	}
}

fn alibaba_rules() []RuleItem {
	return [
		RuleItem{
			id:       'ai_commerce_core'
			title:    'AI commerce product thesis is core to the pitch and demo.'
			status:   'done'
			evidence: 'docs/pitch/product_pitch.md'
		},
		RuleItem{
			id:       'accio_work_use'
			title:    'Accio Work / Alibaba CoCreate flow is mapped for application drafting.'
			status:   'done'
			evidence: 'submission/accio_cocreate_payload.json'
		},
		RuleItem{
			id:       'demo_mvp'
			title:    'Interactive demo MVP shows sourcing, risk, and ROI workflows.'
			status:   'done'
			evidence: 'C:\\git\\websites\\alibaba_cocreate_pitch_2026'
		},
		RuleItem{
			id:       'unit_economics'
			title:    'Landed-cost, margin, CAC, payback, and supplier-risk economics are ready.'
			status:   'done'
			evidence: 'docs/pitch/unit_economics.md'
		},
		RuleItem{
			id:       'competitive_edge'
			title:    'Competitive positioning, judge rebuttals, and moat claims are ready.'
			status:   'done'
			evidence: 'docs/pitch/judge_scorecard.md'
		},
		RuleItem{
			id:       'video'
			title:    'Short demo-video outline and production shot list are ready.'
			status:   'done'
			evidence: 'docs/media/video_outline.md'
		},
		RuleItem{
			id:       'submission_packet'
			title:    'Submission packet includes copy blocks, checklist, evidence, and automation receipts.'
			status:   'done'
			evidence: 'submission/SUBMISSION_PACKET.md'
		},
		RuleItem{
			id:       'external_submit'
			title:    'External form can be filled only in an authorized operator session.'
			status:   'ready_for_authorized_session'
			evidence: 'runbooks/automation.md'
		},
	]
}

fn alibaba_milestones() []Milestone {
	return [
		Milestone{
			version: '0.1.0'
			title:   'Opportunity workspace and task tracking'
			target:  '2026-05-29'
			status:  'done'
		},
		Milestone{
			version: '0.2.0'
			title:   'Reusable ContestOps profile'
			target:  '2026-05-29'
			status:  'done'
		},
		Milestone{
			version: '0.4.0'
			title:   'AI commerce backend and demo data'
			target:  '2026-05-29'
			status:  'done'
		},
		Milestone{
			version: '0.6.0'
			title:   'Vue storefront/demo MVP'
			target:  '2026-05-29'
			status:  'done'
		},
		Milestone{
			version: '0.8.0'
			title:   'Submission packet, media, and automation'
			target:  '2026-05-29'
			status:  'done'
		},
		Milestone{
			version: '1.0.0'
			title:   'Production-ready submission package'
			target:  '2026-05-29'
			status:  'done'
		},
	]
}

fn alibaba_evidence() []EvidenceSlot {
	return [
		EvidenceSlot{
			name:        'official_source_snapshot'
			status:      'done'
			public_path: 'docs/research/current_opportunity.md'
			private_ref: 'official CoCreate Pitch and Accio Work pages'
		},
		EvidenceSlot{
			name:        'product_demo'
			status:      'done'
			public_path: 'submission/demo_manifest.json'
			private_ref: 'C:\\git\\websites\\alibaba_cocreate_pitch_2026'
		},
		EvidenceSlot{
			name:        'economics_export'
			status:      'done'
			public_path: 'evidence/unit_economics.json'
			private_ref: 'C:\\git\\v_projects\\alibaba_cocreate_pitch_2026'
		},
		EvidenceSlot{
			name:        'automation_receipts'
			status:      'done'
			public_path: 'automation/evidence/dry-run/cocreate_submission_dry_run_trace.jsonl'
			private_ref: 'WAIBAv authorized browser session'
		},
		EvidenceSlot{
			name:        'video_outline'
			status:      'done'
			public_path: 'docs/media/video_outline.md'
			private_ref: 'local capture plan'
		},
		EvidenceSlot{
			name:        'judge_scorecard'
			status:      'done'
			public_path: 'docs/pitch/judge_scorecard.md'
			private_ref: 'competitive pitch strategy'
		},
	]
}

fn alibaba_integrations() []Integration {
	return [
		Integration{
			kind:     'accio_work'
			name:     'Accio Work submission and AI commerce workflow'
			status:   'ready_for_authorized_session'
			evidence: 'submission/accio_cocreate_payload.json'
		},
		Integration{
			kind:     'vue3_cdn_unocss'
			name:     'Interactive storefront and sourcing cockpit'
			status:   'done'
			evidence: 'C:\\git\\websites\\alibaba_cocreate_pitch_2026'
		},
		Integration{
			kind:     'vlang'
			name:     'Catalog signals, ROI, and evidence export CLI'
			status:   'done'
			evidence: 'C:\\git\\v_projects\\alibaba_cocreate_pitch_2026'
		},
		Integration{
			kind:     'waibav'
			name:     'Authorized external form preparation and receipt capture'
			status:   'done'
			evidence: 'automation/waiba'
		},
		Integration{
			kind:     'contestops_ai'
			name:     'Submission package manifest generator'
			status:   'done'
			evidence: 'C:\\git\\v_projects\\contestops_ai'
		},
	]
}
