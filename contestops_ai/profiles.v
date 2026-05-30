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
		else {
			return error('unknown profile: ${profile}')
		}
	}
}
