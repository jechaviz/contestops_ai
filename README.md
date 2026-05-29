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
v run . -- gemini-smoke out\gemini_receipt.json --mock
```

Use the RAISE startup-competition profile with:

```powershell
v run . -- manifest --profile raise out\raise_manifest.json
v run . -- checklist --profile raise out\raise_RULES_CHECKLIST.generated.md
v run . -- evidence --profile raise out\raise_EVIDENCE.generated.md
v run . -- application-packet --profile raise out\raise_APPLICATION_PACKET.generated.md
```

Use the Alibaba CoCreate Pitch / Accio Work profile with:

```powershell
v run . -- manifest --profile alibaba out\alibaba_manifest.json
v run . -- checklist --profile alibaba out\alibaba_RULES_CHECKLIST.generated.md
v run . -- evidence --profile alibaba out\alibaba_EVIDENCE.generated.md
v run . -- application-packet --profile alibaba out\alibaba_APPLICATION_PACKET.generated.md
```

Use a real Gemini call with:

```powershell
$env:GEMINI_API_KEY='...'
v run . -- gemini-smoke out\gemini_receipt.json
```

## Architecture

- `types.v`: small domain contracts.
- `package.v`: default Build with Gemini XPRIZE package data.
- `raise_package.v`: RAISE the STAKES startup application package data.
- `alibaba_package.v`: Alibaba CoCreate Pitch / Accio Work package data.
- `profiles.v`: profile selection for opportunity-specific packages.
- `render.v`: JSON and markdown emitters.
- `gemini.v`: provider interface, mock provider, env-backed Gemini provider.
- `main.v`: thin CLI.

Files stay below 600 lines; product data is separated from renderers and
providers.
