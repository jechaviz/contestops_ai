# ContestOps AI

Reusable V core for the Build with Gemini XPRIZE product package.

`ContestOps AI` turns opportunity rules into execution plans, evidence ledgers,
submission payloads, and automation receipts. The first production package lives
in:

`C:\git\v_projects\contests\worth_it\build_with_gemini_xprize`

## Commands

```powershell
v run . -- manifest out\manifest.json
v run . -- checklist out\RULES_CHECKLIST.generated.md
v run . -- evidence out\EVIDENCE.generated.md
v run . -- application-packet out\APPLICATION_PACKET.generated.md
v run . -- strategic-brief out\STRATEGIC_BRIEF.generated.md
v run . -- judge-scorecard out\JUDGE_SCORECARD.generated.md
v run . -- gemini-smoke out\gemini_receipt.json --mock
```

Use the RAISE startup-competition profile with:

```powershell
v run . -- manifest --profile raise out\raise_manifest.json
v run . -- checklist --profile raise out\raise_RULES_CHECKLIST.generated.md
v run . -- evidence --profile raise out\raise_EVIDENCE.generated.md
v run . -- application-packet --profile raise out\raise_APPLICATION_PACKET.generated.md
v run . -- strategic-brief --profile raise out\raise_STRATEGIC_BRIEF.generated.md
v run . -- judge-scorecard --profile raise out\raise_JUDGE_SCORECARD.generated.md
```

Use the Alibaba CoCreate Pitch / Accio Work profile with:

```powershell
v run . -- manifest --profile alibaba out\alibaba_manifest.json
v run . -- checklist --profile alibaba out\alibaba_RULES_CHECKLIST.generated.md
v run . -- evidence --profile alibaba out\alibaba_EVIDENCE.generated.md
v run . -- application-packet --profile alibaba out\alibaba_APPLICATION_PACKET.generated.md
v run . -- strategic-brief --profile alibaba out\alibaba_STRATEGIC_BRIEF.generated.md
v run . -- judge-scorecard --profile alibaba out\alibaba_JUDGE_SCORECARD.generated.md
```

Use the Accion Trust by Design Fintech Challenge profile with:

```powershell
v run . -- manifest --profile accion_trust out\accion_manifest.json
v run . -- checklist --profile accion_trust out\accion_RULES_CHECKLIST.generated.md
v run . -- evidence --profile accion_trust out\accion_EVIDENCE.generated.md
v run . -- application-packet --profile accion_trust out\accion_APPLICATION_PACKET.generated.md
v run . -- strategic-brief --profile accion_trust out\accion_STRATEGIC_BRIEF.generated.md
v run . -- judge-scorecard --profile accion_trust out\accion_JUDGE_SCORECARD.generated.md
```

Use the USAII Global AI Hackathon 2026 profile with:

```powershell
v run . -- manifest --profile usaii out\usaii_manifest.json
v run . -- checklist --profile usaii out\usaii_RULES_CHECKLIST.generated.md
v run . -- evidence --profile usaii out\usaii_EVIDENCE.generated.md
v run . -- application-packet --profile usaii out\usaii_APPLICATION_PACKET.generated.md
v run . -- strategic-brief --profile usaii out\usaii_STRATEGIC_BRIEF.generated.md
v run . -- judge-scorecard --profile usaii out\usaii_JUDGE_SCORECARD.generated.md
```

Use a real Gemini call with:

```powershell
$env:GEMINI_API_KEY='...'
v run . -- gemini-smoke out\gemini_receipt.json
```

## Cloud Run

- `cmd/contestops-api`: V HTTP API exposing `/health`, `/manifest`,
  `/checklist`, and `/evidence`.
- `Dockerfile`: container build for Cloud Run.
- `deploy/cloudrun-service.yaml`: Knative service skeleton for Google Cloud.

## Architecture

- `types.v`: small domain contracts.
- `package.v`: default Build with Gemini XPRIZE package data.
- `raise_package.v`: RAISE the STAKES startup application package data.
- `alibaba_package.v`: Alibaba CoCreate Pitch / Accio Work package data.
- `usaii_package.v`: USAII Global AI Hackathon student package data.
- `competitive.v`: judge scoring, competitor archetypes, and next moves.
- `profiles.v`: profile selection for opportunity-specific packages.
- `render.v`: JSON and markdown emitters.
- `gemini.v`: provider interface, mock provider, env-backed Gemini provider.
- `main.v`: thin CLI.

Files stay below 600 lines; product data is separated from renderers and
providers.
