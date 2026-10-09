$ErrorActionPreference = 'Stop'
$studioRoot = $PSScriptRoot
$studioUrl = 'http://127.0.0.1:8766'
try {
    $health = Invoke-RestMethod -Uri "$studioUrl/api/health" -TimeoutSec 2
    if ($health.app -eq 'azurik-level-studio') {
        Start-Process $studioUrl
        exit
    }
} catch {}
$pythonPath = (& py -3 -c "import sys; print(sys.executable)").Trim()
if (-not (Test-Path -LiteralPath $pythonPath)) { throw 'Python 3 est introuvable.' }
$logDir = Join-Path $studioRoot 'logs'
New-Item -ItemType Directory -Path $logDir -Force | Out-Null
Start-Process -FilePath $pythonPath -ArgumentList @(('"' + (Join-Path $studioRoot 'server.py') + '"'), '--open') -WorkingDirectory $studioRoot -WindowStyle Hidden -RedirectStandardOutput (Join-Path $logDir 'studio.log') -RedirectStandardError (Join-Path $logDir 'studio-error.log')
