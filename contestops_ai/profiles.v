module contestops_ai

pub fn manifest_for_profile(profile string) !PackageManifest {
	match profile {
		'', 'default', 'gemini', 'build_with_gemini_xprize' {
			return default_manifest()
		}
		'raise', 'raise_the_stakes', 'raise_the_stakes_ai_startup_competition' {
			return raise_manifest()
		}
		'alibaba', 'alibaba_cocreate', 'alibaba_cocreate_pitch_2026', 'accio_work' {
			return alibaba_manifest()
		}
		'accion_trust', 'accion_trust_by_design', 'accion_trust_by_design_fintech',
		'student_partner_track' {
			return accion_trust_manifest()
		}
		'usaii', 'usaii_global_ai_hackathon', 'usaii_global_ai_hackathon_2026',
		'usaii_student_partner_track' {
			return usaii_manifest()
		}
		'wfp', 'wfp_sdg2', 'wfp_innovation_challenge_sdg2', 'food_risk_signal_desk',
		'impact_grants' {
			return wfp_sdg2_manifest()
		}
		else {
			return error('unknown profile: ${profile}')
		}
	}
}
