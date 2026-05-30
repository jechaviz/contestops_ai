param(
  [string]$ProjectId = $env:GOOGLE_CLOUD_PROJECT,
  [string]$Region = "us-central1",
  [string]$ServiceName = "contestops-ai-api",
  [string]$SourceDir = "C:\git\v_projects\contestops_ai",
  [string]$GeminiApiKey = $env:GEMINI_API_KEY,
  [string]$GeminiSecretName = "contestops-gemini-api-key",
  [string]$Gcloud = "C:\Users\jecha\GoogleCloudSDK\google-cloud-sdk\bin\gcloud.cmd",
  [switch]$ProbeOnly
)

$ErrorActionPreference = "Stop"

function Fail-WithReceipt {
  param([string]$Reason, [hashtable]$Extra = @{})
  $receipt = @{
    ok = $false
    reason = $Reason
    project_id_present = -not [string]::IsNullOrWhiteSpace($ProjectId)
    gcloud_path = $Gcloud
    source_dir = $SourceDir
  } + $Extra
  $receipt | ConvertTo-Json -Depth 6
  exit 1
}

if (-not (Test-Path -LiteralPath $Gcloud)) {
  Fail-WithReceipt "gcloud_not_found"
}

$version = & $Gcloud --version
$accountsJson = & $Gcloud auth list --format=json
$accounts = $accountsJson | ConvertFrom-Json
$active = @($accounts | Where-Object { $_.status -eq "ACTIVE" })

if ($active.Count -eq 0) {
  Fail-WithReceipt "gcloud_auth_required" @{
    gcloud_version = $version[0]
    next_command = "gcloud auth login"
  }
}

if ([string]::IsNullOrWhiteSpace($ProjectId)) {
  $ProjectId = (& $Gcloud config get-value project 2>$null).Trim()
}

if ([string]::IsNullOrWhiteSpace($ProjectId)) {
  Fail-WithReceipt "project_id_required" @{
    active_account = $active[0].account
    next_command = "gcloud config set project PROJECT_ID"
  }
}

if ($ProbeOnly) {
  @{
    ok = $true
    probe_only = $true
    gcloud_version = $version[0]
    active_account = $active[0].account
    project_id = $ProjectId
    region = $Region
    service_name = $ServiceName
  } | ConvertTo-Json -Depth 6
  exit 0
}

& $Gcloud config set project $ProjectId | Out-Null
& $Gcloud services enable run.googleapis.com cloudbuild.googleapis.com artifactregistry.googleapis.com secretmanager.googleapis.com --project $ProjectId | Out-Null

$secretArgs = @()
if (-not [string]::IsNullOrWhiteSpace($GeminiApiKey)) {
  $secretExists = $true
  & $Gcloud secrets describe $GeminiSecretName --project $ProjectId *> $null
  if ($LASTEXITCODE -ne 0) {
    $secretExists = $false
  }
  if (-not $secretExists) {
    & $Gcloud secrets create $GeminiSecretName --replication-policy automatic --project $ProjectId | Out-Null
  }
  $tmpSecret = [System.IO.Path]::GetTempFileName()
  try {
    Set-Content -LiteralPath $tmpSecret -Value $GeminiApiKey -NoNewline
    & $Gcloud secrets versions add $GeminiSecretName --data-file $tmpSecret --project $ProjectId | Out-Null
  } finally {
    Remove-Item -LiteralPath $tmpSecret -Force -ErrorAction SilentlyContinue
  }
  & $Gcloud secrets add-iam-policy-binding $GeminiSecretName `
    --member "serviceAccount:$ProjectId-compute@developer.gserviceaccount.com" `
    --role roles/secretmanager.secretAccessor `
    --project $ProjectId | Out-Null
  $secretArgs = @("--set-secrets", "GEMINI_API_KEY=$GeminiSecretName:latest")
}

& $Gcloud run deploy $ServiceName `
  --source $SourceDir `
  --region $Region `
  --allow-unauthenticated `
  --project $ProjectId `
  @secretArgs

$serviceUrl = (& $Gcloud run services describe $ServiceName --region $Region --project $ProjectId --format "value(status.url)").Trim()

@{
  ok = $true
  service_url = $serviceUrl
  project_id = $ProjectId
  region = $Region
  service_name = $ServiceName
} | ConvertTo-Json -Depth 6
