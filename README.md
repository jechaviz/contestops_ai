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
v run . -- gemini-smoke out\gemini_receipt.json --mock
```

Use a real Gemini call with:

```powershell
$env:GEMINI_API_KEY='...'
v run . -- gemini-smoke out\gemini_receipt.json
```

## Architecture

- `types.v`: small domain contracts.
- `package.v`: default Build with Gemini XPRIZE package data.
- `render.v`: JSON and markdown emitters.
- `gemini.v`: provider interface, mock provider, env-backed Gemini provider.
- `main.v`: thin CLI.

Files stay below 600 lines; product data is separated from renderers and
providers.
