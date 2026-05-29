module tests

import contestops_ai

fn test_manifest_covers_required_xprize_integrations() {
	manifest := contestops_ai.default_manifest()
	assert manifest.project_name == 'ContestOps AI'
	assert manifest.prod_score >= 20
	assert has_integration(manifest, 'gemini_api')
	assert has_integration(manifest, 'google_cloud')
	assert has_rule(manifest, 'revenue')
	assert has_rule(manifest, 'users')
}

fn test_renderers_emit_submission_artifacts() {
	manifest := contestops_ai.default_manifest()
	checklist := contestops_ai.checklist_markdown(manifest)
	evidence := contestops_ai.evidence_markdown(manifest)
	json := contestops_ai.manifest_json(manifest)
	assert checklist.contains('Gemini API')
	assert evidence.contains('gemini_call')
	assert json.contains('"project_name": "ContestOps AI"')
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
