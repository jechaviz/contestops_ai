module contestops_ai

pub fn manifest_json(manifest PackageManifest) string {
	return '{\n' + field('project_name', manifest.project_name, true) +
		field('version', manifest.version, true) + field('category', manifest.category, true) +
		field('deadline', manifest.deadline, true) + '  "prod_score": ${manifest.prod_score},\n' +
		'  "rules": ${rules_json(manifest.rules)},\n' +
		'  "milestones": ${milestones_json(manifest.milestones)},\n' +
		'  "evidence": ${evidence_json(manifest.evidence)},\n' +
		'  "integrations": ${integrations_json(manifest.integrations)},\n' +
		'  "scorecard": ${scorecard_json(manifest.scorecard)},\n' +
		'  "proof_sprint": ${proof_sprint_json(manifest.proof_sprint)}\n' + '}\n'
}

pub fn checklist_markdown(manifest PackageManifest) string {
	mut lines := []string{}
	lines << '# ${manifest.project_name} Checklist'
	lines << ''
	lines << 'Version: `${manifest.version}`'
	lines << ''
	lines << '| Status | Rule | Evidence |'
	lines << '|---|---|---|'
	for rule in manifest.rules {
		lines << '| ${rule.status} | ${rule.title} | `${rule.evidence}` |'
	}
	lines << ''
	lines << 'Deadline: ${manifest.deadline}'
	return lines.join('\n') + '\n'
}

pub fn evidence_markdown(manifest PackageManifest) string {
	mut lines := []string{}
	lines << '# ${manifest.project_name} Evidence Manifest'
	lines << ''
	lines << '| Status | Evidence | Public path | Private reference |'
	lines << '|---|---|---|---|'
	for slot in manifest.evidence {
		lines << '| ${slot.status} | ${slot.name} | `${slot.public_path}` | `${slot.private_ref}` |'
	}
	lines << ''
	lines << '## Integrations'
	lines << ''
	lines << '| Status | Kind | Name | Evidence |'
	lines << '|---|---|---|---|'
	for item in manifest.integrations {
		lines << '| ${item.status} | ${item.kind} | ${item.name} | `${item.evidence}` |'
	}
	return lines.join('\n') + '\n'
}

pub fn application_packet_markdown(manifest PackageManifest) string {
	mut lines := []string{}
	lines << '# ${manifest.project_name} Application Packet'
	lines << ''
	lines << 'Version: `${manifest.version}`'
	lines << 'Category: ${manifest.category}'
	lines << 'Deadline: ${manifest.deadline}'
	lines << 'Production readiness: ${manifest.prod_score}%'
	lines << ''
	lines << '## Application Thesis'
	lines << ''
	lines << application_thesis(manifest)
	lines << ''
	lines << '## Eligibility Gates'
	lines << ''
	for rule in manifest.rules {
		lines << '- ${rule.status}: ${rule.title} Evidence: `${rule.evidence}`.'
	}
	lines << ''
	lines << '## Milestones'
	lines << ''
	for milestone in manifest.milestones {
		lines << '- ${milestone.version}: ${milestone.title} (${milestone.target}, ${milestone.status}).'
	}
	lines << ''
	lines << '## Evidence'
	lines << ''
	for slot in manifest.evidence {
		lines << '- ${slot.status}: ${slot.name} at `${slot.public_path}`.'
	}
	lines << ''
	lines << '## Proof Sprint'
	lines << ''
	lines << '- ${manifest.proof_sprint.window}: ${manifest.proof_sprint.objective}'
	return lines.join('\n') + '\n'
}

pub fn strategic_brief_markdown(manifest PackageManifest) string {
	mut lines := []string{}
	lines << '# ${manifest.project_name} Strategic Brief'
	lines << ''
	lines << 'Version: `${manifest.version}`'
	lines << 'Category: ${manifest.category}'
	lines << 'Deadline: ${manifest.deadline}'
	lines << 'Production readiness: ${manifest.prod_score}%'
	lines << ''
	lines << '## Winning Thesis'
	lines << ''
	lines << winning_thesis(manifest)
	lines << ''
	lines << '## Proof Priorities'
	lines << ''
	lines << '- show the product operating end to end;'
	lines << '- make AI decisions inspectable through generated artifacts;'
	lines << '- tie every claim to an evidence slot;'
	lines << '- keep external submission automation receipt-backed;'
	lines << '- remove private applicant data from public artifacts.'
	lines << ''
	lines << '## Strongest Evidence'
	lines << ''
	for slot in manifest.evidence {
		if slot.status in ['active', 'planned'] {
			lines << '- ${slot.name}: `${slot.public_path}` (${slot.status}).'
		}
	}
	lines << ''
	lines << '## Competitive Frame'
	lines << ''
	lines << competitive_frame(manifest)
	lines << ''
	lines << '## Closing Line'
	lines << ''
	lines << '${manifest.project_name} turns deadline pressure into a repeatable AI operations workflow with checklists, evidence, payloads, and receipts.'
	lines << ''
	lines << '## Proof Sprint'
	lines << ''
	for metric in manifest.proof_sprint.metrics {
		lines << '- ${metric.label}: ${metric.current}/${metric.target} (${metric.status}).'
	}
	return lines.join('\n') + '\n'
}

pub fn judge_scorecard_markdown(manifest PackageManifest) string {
	scorecard := manifest.scorecard
	mut lines := []string{}
	lines << '# ${manifest.project_name} Judge Scorecard'
	lines << ''
	lines << 'Overall competitive score: ${scorecard.overall}/100'
	lines << ''
	lines << '| Dimension | Score | Weight | Evidence | Gap |'
	lines << '|---|---:|---:|---|---|'
	for dimension in scorecard.dimensions {
		lines << '| ${dimension.label} | ${dimension.score} | ${dimension.weight} | `${dimension.evidence}` | ${dimension.gap} |'
	}
	lines << ''
	lines << '## Competitor Battlecard'
	lines << ''
	lines << '| Archetype | Threat | Strength | Counter |'
	lines << '|---|---:|---|---|'
	for competitor in scorecard.competitors {
		lines << '| ${competitor.name} | ${competitor.threat} | ${competitor.strength} | ${competitor.counter} |'
	}
	lines << ''
	lines << '## Highest-Leverage Next Moves'
	lines << ''
	for move in scorecard.next_moves {
		lines << '- ${move}'
	}
	return lines.join('\n') + '\n'
}

fn application_thesis(manifest PackageManifest) string {
	match manifest.project_name {
		'Accio Commerce Copilot' {
			return 'Accio Commerce Copilot helps small importers turn supplier discovery into an AI-scored buy plan with landed cost, margin, supplier risk, Accio Work execution steps, and launch evidence ready for CoCreate Pitch review.'
		}
		else {
			return '${manifest.project_name} turns opportunity discovery, rule reading, evidence collection, demo packaging, and external submissions into AI-native startup operations.'
		}
	}
}

pub fn gemini_receipt_json(response LlmResponse, prompt string) string {
	return '{\n' + field('provider', response.provider, true) +
		field('model', response.model, true) + field('prompt_hash', hash_text(prompt), true) +
		field('content', response.content, true) + '  "mock": ${response.mock},\n' +
		'  "status_code": ${response.status_code}\n' + '}\n'
}

fn winning_thesis(manifest PackageManifest) string {
	if manifest.category == 'AI startup pitch' {
		return '${manifest.project_name} should be judged as a live AI operations product: it converts messy startup opportunities into execution plans, evidence ledgers, pitch assets, structured payloads, and external submission workflows.'
	}
	return '${manifest.project_name} should be judged by its ability to turn opportunity rules into running workflows, traceable evidence, and submission-ready artifacts.'
}

fn competitive_frame(manifest PackageManifest) string {
	if manifest.category == 'AI startup pitch' {
		return 'Position against portals, proposal writers, grant databases, generic agents, and consultants. The wedge is full application operations for founders, not only discovery or writing.'
	}
	return 'Position against manual operations and generic AI tooling by emphasizing domain-specific rules, evidence boundaries, and automation receipts.'
}

fn rules_json(items []RuleItem) string {
	mut parts := []string{}
	for item in items {
		parts << '{"id":"${escape_json(item.id)}","title":"${escape_json(item.title)}","status":"${escape_json(item.status)}","evidence":"${escape_json(item.evidence)}"}'
	}
	return '[' + parts.join(',') + ']'
}

fn milestones_json(items []Milestone) string {
	mut parts := []string{}
	for item in items {
		parts << '{"version":"${escape_json(item.version)}","title":"${escape_json(item.title)}","target":"${escape_json(item.target)}","status":"${escape_json(item.status)}"}'
	}
	return '[' + parts.join(',') + ']'
}

fn evidence_json(items []EvidenceSlot) string {
	mut parts := []string{}
	for item in items {
		parts << '{"name":"${escape_json(item.name)}","status":"${escape_json(item.status)}","public_path":"${escape_json(item.public_path)}","private_ref":"${escape_json(item.private_ref)}"}'
	}
	return '[' + parts.join(',') + ']'
}

fn integrations_json(items []Integration) string {
	mut parts := []string{}
	for item in items {
		parts << '{"kind":"${escape_json(item.kind)}","name":"${escape_json(item.name)}","status":"${escape_json(item.status)}","evidence":"${escape_json(item.evidence)}"}'
	}
	return '[' + parts.join(',') + ']'
}

fn scorecard_json(scorecard JudgeScorecard) string {
	return '{"overall":${scorecard.overall},"dimensions":${dimensions_json(scorecard.dimensions)},"competitors":${competitors_json(scorecard.competitors)},"next_moves":${strings_json(scorecard.next_moves)}}'
}

fn dimensions_json(items []ScoreDimension) string {
	mut parts := []string{}
	for item in items {
		parts << '{"id":"${escape_json(item.id)}","label":"${escape_json(item.label)}","score":${item.score},"weight":${item.weight},"evidence":"${escape_json(item.evidence)}","gap":"${escape_json(item.gap)}"}'
	}
	return '[' + parts.join(',') + ']'
}

fn competitors_json(items []CompetitorArchetype) string {
	mut parts := []string{}
	for item in items {
		parts << '{"name":"${escape_json(item.name)}","strength":"${escape_json(item.strength)}","weakness":"${escape_json(item.weakness)}","counter":"${escape_json(item.counter)}","threat":${item.threat}}'
	}
	return '[' + parts.join(',') + ']'
}

fn strings_json(items []string) string {
	mut parts := []string{}
	for item in items {
		parts << '"${escape_json(item)}"'
	}
	return '[' + parts.join(',') + ']'
}

fn field(key string, value string, comma bool) string {
	suffix := if comma { ',' } else { '' }
	return '  "${escape_json(key)}": "${escape_json(value)}"${suffix}\n'
}

fn escape_json(value string) string {
	return value.replace('\\', '\\\\').replace('"', '\\"').replace('\n', '\\n').replace('\r', '\\r').replace('\t',
		'\\t')
}

fn hash_text(value string) string {
	mut hash := u32(2166136261)
	for ch in value.bytes() {
		hash ^= u32(ch)
		hash *= u32(16777619)
	}
	return '${hash:08x}'
}
