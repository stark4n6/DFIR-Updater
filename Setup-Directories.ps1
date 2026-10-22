# Setup-Directories.ps1
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$TargetDir = Split-Path -Parent $ScriptDir

# Define the comprehensive DFIR directory structure
$RequiredFolders = @(
    "01_Acquisition",
    "02_Analysis",
    "03_Network",
    "04_Mobile-Forensics",
    "05_Case-Files",
    "06_Training",
    "07_Documentation",
    "08_Utilities",
    "PortableApps",
    "Shortcuts"
)

Write-Host "Verifying DFIR directory structure in $TargetDir..." -ForegroundColor Cyan

foreach ($Folder in $RequiredFolders) {$TargetPath = Join-Path -Path $TargetDir -ChildPath $Folder
    if (-not (Test-Path -Path $TargetPath)) {
        New-Item -ItemType Directory -Path $TargetPath -Force | Out-Null
        Write-Host "[+] Created missing directory: $Folder" -ForegroundColor Green
    } else {
        Write-Host "[*] Directory already exists: $Folder" -ForegroundColor DarkGray
    }
}