# Local runner for Export-Alerts.ps1
# Usage: .\Run-Local.ps1 -Pat "your-pat-token"

param(
    [Parameter(Mandatory = $true)]
    [string]$Pat
)

# Set environment variables used by the export script
$env:ADO_ORGANIZATION = "MngEnvMCAP675646"
$env:ADO_PAT = $Pat
$env:OUTPUT_CSV_FILE = "All-ADO-Alerts.csv"

Write-Host "Running export for organization: $env:ADO_ORGANIZATION" -ForegroundColor Cyan

# Run the export script
& "$PSScriptRoot\Export-Alerts.ps1"

# Clean up sensitive env var
Remove-Item Env:\ADO_PAT -ErrorAction SilentlyContinue

Write-Host "`nDone! Check All-ADO-Alerts.csv for results." -ForegroundColor Green
