module contestops_ai

pub fn manifest_json(manifest PackageManifest) string {
	return '{\n' + field('project_name', manifest.project_name, true) +
		field('version', manifest.version, true) + field('category', manifest.category, true) +
		field('deadline', manifest.deadline, true) + '  "prod_score": ${manifest.prod_score},\n' +
		'  "rules": ${rules_json(manifest.rules)},\n' +
		'  "milestones": ${milestones_json(manifest.milestones)},\n' +
		'  "evidence": ${evidence_json(manifest.evidence)},\n' +
		'  "integrations": ${integrations_json(manifest.integrations)}\n' + '}\n'
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
	lines << '${manifest.project_name} turns opportunity discovery, rule reading, evidence collection, demo packaging, and external submissions into AI-native startup operations.'
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
	return lines.join('\n') + '\n'
}

pub fn gemini_receipt_json(response LlmResponse, prompt string) string {
	return '{\n' + field('provider', response.provider, true) +
		field('model', response.model, true) + field('prompt_hash', hash_text(prompt), true) +
		field('content', response.content, true) + '  "mock": ${response.mock},\n' +
		'  "status_code": ${response.status_code}\n' + '}\n'
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
