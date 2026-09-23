param(
  [string]$ProjectName = "luizmathias",
  [string]$SiteDir = (Get-Location).Path,
  [string]$TokenFile = "$env:USERPROFILE\.vercel-token"
)
$ErrorActionPreference = "Stop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

if (-not (Test-Path $TokenFile)) { throw "Token file not found at $TokenFile" }
$token = (Get-Content $TokenFile -Raw).Trim()
$headers = @{ Authorization = "Bearer $token" }

$html = [IO.File]::ReadAllText((Join-Path $SiteDir "index.html"), [Text.Encoding]::UTF8)
$payload = @{
  name            = $ProjectName
  target          = "production"
  files           = @(@{ file = "index.html"; data = $html; encoding = "utf-8" })
  projectSettings = @{ framework = $null; buildCommand = $null; outputDirectory = $null; installCommand = $null }
}
$json = $payload | ConvertTo-Json -Depth 6
$bytes = [Text.Encoding]::UTF8.GetBytes($json)

$dep = Invoke-RestMethod -Method Post -Uri "https://api.vercel.com/v13/deployments?skipAutoDetectionConfirmation=1" `
  -Headers $headers -ContentType "application/json; charset=utf-8" -Body $bytes

"Deployment id : $($dep.id)"
"Deployment url: https://$($dep.url)"

# Wait for the build to finish
for ($i = 0; $i -lt 30; $i++) {
  Start-Sleep -Seconds 3
  $s = Invoke-RestMethod -Uri "https://api.vercel.com/v13/deployments/$($dep.id)" -Headers $headers
  if ($s.readyState -in @("READY", "ERROR", "CANCELED")) { break }
}
"State         : $($s.readyState)"
if ($s.alias) { $s.alias | ForEach-Object { "Alias         : https://$_" } }
