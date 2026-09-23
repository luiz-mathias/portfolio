param(
  [Parameter(Mandatory)] [string]$TokenFile,
  [string]$Repo = "portfolio",
  [string]$SiteDir = (Get-Location).Path,
  [string[]]$Files = @("index.html", "README.md", ".gitignore", "deploy-vercel.ps1"),
  [string]$Message = "Publish portfolio site"
)
$ErrorActionPreference = "Stop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$token = (Get-Content $TokenFile -Raw).Trim()
$h = @{ Authorization = "Bearer $token"; Accept = "application/vnd.github+json"; "X-GitHub-Api-Version" = "2022-11-28"; "User-Agent" = "portfolio-push" }

$me = Invoke-RestMethod -Uri "https://api.github.com/user" -Headers $h
$owner = $me.login
"GitHub user   : $owner"

# Create the repo if it doesn't exist yet
try {
  $r = Invoke-RestMethod -Uri "https://api.github.com/repos/$owner/$Repo" -Headers $h
  "Repo exists   : $($r.html_url)"
} catch {
  if ($_.Exception.Response.StatusCode.value__ -ne 404) { throw }
  $body = @{ name = $Repo; description = "Personal portfolio site · live at https://luizmathias.vercel.app"; homepage = "https://luizmathias.vercel.app"; private = $false } | ConvertTo-Json
  $r = Invoke-RestMethod -Method Post -Uri "https://api.github.com/user/repos" -Headers $h -ContentType "application/json" -Body $body
  "Repo created  : $($r.html_url)"
  Start-Sleep -Seconds 2
}

foreach ($f in $Files) {
  $path = Join-Path $SiteDir $f
  $b64 = [Convert]::ToBase64String([IO.File]::ReadAllBytes($path))
  $uri = "https://api.github.com/repos/$owner/$Repo/contents/$f"
  $payload = @{ message = "$Message ($f)"; content = $b64 }
  try { $existing = Invoke-RestMethod -Uri $uri -Headers $h; $payload.sha = $existing.sha } catch { }
  $res = Invoke-RestMethod -Method Put -Uri $uri -Headers $h -ContentType "application/json" -Body ($payload | ConvertTo-Json)
  "Uploaded      : $f"
}
"Done          : https://github.com/$owner/$Repo"
