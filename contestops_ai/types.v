module contestops_ai

pub struct RuleItem {
pub:
	id       string
	title    string
	status   string
	evidence string
}

pub struct Milestone {
pub:
	version string
	title   string
	target  string
	status  string
}

pub struct EvidenceSlot {
pub:
	name        string
	status      string
	public_path string
	private_ref string
}

pub struct Integration {
pub:
	kind     string
	name     string
	status   string
	evidence string
}

pub struct ScoreDimension {
pub:
	id       string
	label    string
	score    int
	weight   int
	evidence string
	gap      string
}

pub struct CompetitorArchetype {
pub:
	name     string
	strength string
	weakness string
	counter  string
	threat   int
}

pub struct JudgeScorecard {
pub:
	project_name string
	overall      int
	dimensions   []ScoreDimension
	competitors  []CompetitorArchetype
	next_moves   []string
}

pub struct PackageManifest {
pub:
	project_name string
	version      string
	category     string
	deadline     string
	prod_score   int
	rules        []RuleItem
	milestones   []Milestone
	evidence     []EvidenceSlot
	integrations []Integration
	scorecard    JudgeScorecard
}

pub struct LlmResponse {
pub:
	provider    string
	model       string
	content     string
	raw_body    string
	mock        bool
	status_code int
}

pub interface LlmProvider {
	complete(prompt string) !LlmResponse
}
