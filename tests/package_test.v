module tests

import contestops_ai

fn test_manifest_covers_required_xprize_integrations() {
	manifest := contestops_ai.default_manifest()
	assert manifest.project_name == 'ContestOps AI'
	assert manifest.prod_score >= 80
	assert has_integration(manifest, 'gemini_api')
	assert has_integration(manifest, 'google_cloud')
	assert has_rule(manifest, 'revenue')
	assert has_rule(manifest, 'users')
	assert manifest.scorecard.overall >= 78
	assert manifest.scorecard.competitors.len >= 4
	assert manifest.proof_sprint.metrics.len >= 6
}

fn test_renderers_emit_submission_artifacts() {
	manifest := contestops_ai.default_manifest()
	checklist := contestops_ai.checklist_markdown(manifest)
	evidence := contestops_ai.evidence_markdown(manifest)
	json := contestops_ai.manifest_json(manifest)
	assert checklist.contains('Gemini API')
	assert evidence.contains('gemini_call')
	assert json.contains('"project_name": "ContestOps AI"')
	assert json.contains('"scorecard"')
	assert json.contains('"proof_sprint"')
}

fn test_judge_scorecard_names_competitive_gaps() {
	manifest := contestops_ai.default_manifest()
	scorecard := contestops_ai.judge_scorecard_markdown(manifest)
	assert scorecard.contains('Overall competitive score')
	assert scorecard.contains('Vertical AI business with early revenue')
	assert scorecard.contains('14-day proof sprint')
}

fn test_proof_sprint_renderer_names_business_receipts() {
	manifest := contestops_ai.default_manifest()
	sprint := contestops_ai.proof_sprint_markdown(manifest)
	assert sprint.contains('Build with Gemini XPRIZE proof sprint')
	assert sprint.contains('Paid pilots or signed invoices')
	assert sprint.contains('Cloud Run deployment')
	assert sprint.contains('Devpost draft is filled by automation')
}

fn test_raise_profile_covers_startup_competition_gates() {
	manifest := contestops_ai.manifest_for_profile('raise') or { panic(err) }
	assert manifest.category == 'AI startup pitch'
	assert manifest.deadline == '2026-06-10'
	assert manifest.prod_score >= 70
	assert has_rule(manifest, 'ai_core')
	assert has_rule(manifest, 'legal_entity')
	assert has_rule(manifest, 'team')
	assert has_rule(manifest, 'dealum')
	assert has_integration(manifest, 'dealum')
	assert has_integration(manifest, 'waibav')
	assert manifest.scorecard.overall >= 80
	assert manifest.scorecard.competitors.len >= 5
	assert manifest.proof_sprint.metrics.len >= 3
}

fn test_raise_judge_scorecard_is_competition_specific() {
	manifest := contestops_ai.raise_manifest()
	scorecard := contestops_ai.judge_scorecard_markdown(manifest)
	assert scorecard.contains('Team Strength')
	assert scorecard.contains('Startup portals')
	assert scorecard.contains('72-hour proof sprint')
}

fn test_application_packet_renderer_uses_selected_manifest() {
	manifest := contestops_ai.raise_manifest()
	packet := contestops_ai.application_packet_markdown(manifest)
	assert packet.contains('AI startup pitch')
	assert packet.contains('Dealum application payload')
	assert packet.contains('Production readiness: 72%')
}

fn test_strategic_brief_positions_ai_startup_profiles() {
	manifest := contestops_ai.raise_manifest()
	brief := contestops_ai.strategic_brief_markdown(manifest)
	assert brief.contains('Strategic Brief')
	assert brief.contains('Competitive Frame')
	assert brief.contains('full application operations for founders')
}

fn test_alibaba_profile_covers_accio_submission_package() {
	manifest := contestops_ai.manifest_for_profile('alibaba') or { panic(err) }
	assert manifest.project_name == 'Accio Commerce Copilot'
	assert manifest.category == 'AI startup pitch'
	assert manifest.prod_score == 100
	assert has_rule(manifest, 'ai_commerce_core')
	assert has_rule(manifest, 'accio_work_use')
	assert has_rule(manifest, 'unit_economics')
	assert has_rule(manifest, 'competitive_edge')
	assert has_integration(manifest, 'accio_work')
	assert has_integration(manifest, 'vue3_cdn_unocss')
	assert has_integration(manifest, 'vlang')
}

fn test_alibaba_packet_uses_product_specific_thesis() {
	manifest := contestops_ai.alibaba_manifest()
	packet := contestops_ai.application_packet_markdown(manifest)
	assert packet.contains('small importers')
	assert packet.contains('Accio Work execution steps')
	assert packet.contains('Production readiness: 100%')
}

fn test_mock_gemini_receipt_is_deterministic() {
	prompt := 'Plan the next ContestOps AI task.'
	response := contestops_ai.complete_with_default_provider(prompt, true) or { panic(err) }
	receipt := contestops_ai.gemini_receipt_json(response, prompt)
	assert response.mock
	assert receipt.contains('"provider": "mock_gemini"')
	assert receipt.contains('"prompt_hash"')
}

fn has_integration(manifest contestops_ai.PackageManifest, kind string) bool {
	for item in manifest.integrations {
		if item.kind == kind {
			return true
		}
	}
	return false
}

fn has_rule(manifest contestops_ai.PackageManifest, id string) bool {
	for item in manifest.rules {
		if item.id == id {
			return true
		}
	}
	return false
}
