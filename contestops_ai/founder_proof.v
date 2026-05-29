module contestops_ai

pub fn default_founder_proof() FounderProof {
	return FounderProof{
		title:            'Founder and dogfood proof'
		public_summary:   'Mexico-based software architecture and automation founder with 15+ years across enterprise integrations, fiscal software, ERP workflows, AI automation, cloud delivery, and technical leadership.'
		private_boundary: 'Fiscal IDs, phone, email, CSD keys, legal documents, bank data, and raw OCR records stay private and are referenced only through redacted manifests or checksums.'
		signals:          founder_profile_signals()
		dogfood_cases:    founder_dogfood_cases()
	}
}

pub fn founder_profile_markdown(manifest PackageManifest) string {
	proof := manifest.founder_proof
	mut lines := []string{}
	lines << '# ${manifest.project_name} Founder Proof'
	lines << ''
	lines << proof.public_summary
	lines << ''
	lines << 'Private boundary: ${proof.private_boundary}'
	lines << ''
	lines << '## Profile Signals'
	lines << ''
	lines << '| Status | Signal | Evidence | Note |'
	lines << '|---|---|---|---|'
	for signal in proof.signals {
		lines << '| ${signal.status} | ${signal.label} | `${signal.evidence}` | ${signal.note} |'
	}
	lines << ''
	lines << '## Dogfood Cases'
	lines << ''
	lines << '| Status | Case | Evidence | Note |'
	lines << '|---|---|---|---|'
	for item in proof.dogfood_cases {
		lines << '| ${item.status} | ${item.label} | `${item.evidence}` | ${item.note} |'
	}
	return lines.join('\n') + '\n'
}

fn founder_profile_signals() []ProfileSignal {
	return [
		ProfileSignal{
			label:    'Senior architecture and technical leadership'
			status:   'public_redacted'
			evidence: 'C:\\git\\customers\\yo\\cv\\en\\README.md'
			note:     'Public CV material supports leadership, architecture, and delivery claims.'
		},
		ProfileSignal{
			label:    'AI, automation, and Gemini experience'
			status:   'public_redacted'
			evidence: 'C:\\git\\customers\\yo\\cv\\en\\habilidades.md'
			note:     'Skills file lists AI/LLM integrations, Gemini, scraping, and automation.'
		},
		ProfileSignal{
			label:    'Fiscal software and enterprise integrations'
			status:   'public_redacted'
			evidence: 'C:\\git\\customers\\yo\\cv\\en\\logros.md'
			note:     'Selected projects include Mexican electronic billing and integration work.'
		},
		ProfileSignal{
			label:    'Operational profile database'
			status:   'private_redacted'
			evidence: 'C:\\git\\customers\\yo\\profile\\jecha_profile.yml'
			note:     'Used only to derive public-safe summaries and private evidence boundaries.'
		},
	]
}

fn founder_dogfood_cases() []ProfileSignal {
	return [
		ProfileSignal{
			label:    'FacturaMX SaaS'
			status:   'access_gated'
			evidence: 'C:\\git\\customers\\yo\\facturamx-saas'
			note:     'AI Studio app exists, but live access requires Google sign-in handoff.'
		},
		ProfileSignal{
			label:    'Odoo automation workspace'
			status:   'active_private'
			evidence: 'C:\\git\\customers\\yo\\odoo_yo'
			note:     'WAIBAv-compatible Odoo automation utilities and playbooks exist.'
		},
		ProfileSignal{
			label:    'Odoo RPP tutorial and QA evidence'
			status:   'active_private'
			evidence: 'C:\\git\\customers\\yo\\odoo_rpp'
			note:     'Contains product/tutorial automation outputs useful as redacted case-study material.'
		},
		ProfileSignal{
			label:    'AI tutorial maker'
			status:   'active_private'
			evidence: 'C:\\git\\customers\\yo\\ai_tutorial_maker'
			note:     'Shows education and workflow automation product direction.'
		},
		ProfileSignal{
			label:    'Local agent ecosystem'
			status:   'active_public'
			evidence: 'C:\\git\\v_projects\\vimport; C:\\git\\v_projects\\waibav; C:\\git\\v_projects\\veloclaw'
			note:     'Reusable ingestion, automation, and accountable-agent runtimes are available.'
		},
	]
}

fn founder_proof_json(proof FounderProof) string {
	return '{"title":"${escape_json(proof.title)}","public_summary":"${escape_json(proof.public_summary)}","private_boundary":"${escape_json(proof.private_boundary)}","signals":${profile_signals_json(proof.signals)},"dogfood_cases":${profile_signals_json(proof.dogfood_cases)}}'
}

fn profile_signals_json(items []ProfileSignal) string {
	mut parts := []string{}
	for item in items {
		parts << '{"label":"${escape_json(item.label)}","status":"${escape_json(item.status)}","evidence":"${escape_json(item.evidence)}","note":"${escape_json(item.note)}"}'
	}
	return '[' + parts.join(',') + ']'
}
