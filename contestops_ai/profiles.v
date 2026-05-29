module contestops_ai

pub fn manifest_for_profile(profile string) !PackageManifest {
	match profile {
		'', 'default', 'gemini', 'build_with_gemini_xprize' {
			return default_manifest()
		}
		'raise', 'raise_the_stakes', 'raise_the_stakes_ai_startup_competition' {
			return raise_manifest()
		}
		else {
			return error('unknown profile: ${profile}')
		}
	}
}
