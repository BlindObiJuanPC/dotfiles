# Brave Browser
winget install -e --id Brave.Brave --scope machine --accept-package-agreements --accept-source-agreements --silent

# Notepad++
winget install -e --id Notepad++.Notepad++ --scope machine --accept-package-agreements --accept-source-agreements --silent

# 7-zip
winget install -e --id 7zip.7zip --scope machine --accept-package-agreements --accept-source-agreements --silent

# Git
winget install -e --id Git.Git --scope machine --accept-package-agreements --accept-source-agreements --silent

# Everything Search Engine
winget install -e --id voidtools.Everything.Alpha --scope machine --accept-package-agreements --accept-source-agreements --silent
& "C:\Program Files\Everything 1.5a\Everything64.exe" -install-service -install-startup

# VLC Media Player
winget install -e --id VideoLAN.VLC --scope machine --accept-package-agreements --accept-source-agreements --silent

# Greenshot
winget install -e --id Greenshot.Greenshot --scope machine --accept-package-agreements --accept-source-agreements --silent
Stop-Process -Name "msedge" -ErrorAction SilentlyContinue

# Screen to Gif
winget install -e --id NickeManarin.ScreenToGif --scope machine --accept-package-agreements --accept-source-agreements --silent

# Steam
winget install -e --id Valve.Steam --scope machine --accept-package-agreements --accept-source-agreements --silent

# Neovim
winget install -e --id Microsoft.VisualStudioCode --scope machine --accept-package-agreements --accept-source-agreements --silent

# Miniconda
winget install -e --id Anaconda.Miniconda3 --scope user --accept-package-agreements --accept-source-agreements --silent


# --- CLEANUP DESKTOP ICONS---

Write-Host "Removing unwanted desktop shortcuts..." -ForegroundColor Cyan

$desktop = [System.IO.Path]::Combine($env:USERPROFILE, "Desktop")
$publicDesktop = "C:\Users\Public\Desktop"

# List the specific shortcut names created by your installers
# (Matches the names usually given by the apps)
$toRemove = @(
    "Steam", 
    "VLC media player", 
    "Greenshot", 
    "ScreenToGif",
    "Visual Studio Code"
    "Everything 1.5a"
)

foreach ($folder in @($desktop, $publicDesktop)) {
    foreach ($app in $toRemove) {
        $path = Join-Path $folder "$app.lnk"
        if (Test-Path $path) {
            Write-Host "Nuking $app icon from $folder" -ForegroundColor Gray
            Remove-Item $path -Force
        }
    }
}


# --- INITIALIZE CONDA ---

# 1. Initialize Conda for PowerShell and CMD
Write-Host "Initializing Conda for PowerShell and CMD..." -ForegroundColor Cyan
$condaPath = "$env:USERPROFILE\Miniconda3\Scripts\conda.exe"

if (Test-Path $condaPath) {
    & $condaPath init powershell --user
    & $condaPath init cmd.exe --user
} else {
    Write-Host "Miniconda path not found. Check install location." -ForegroundColor Red
}

# 2. Set PowerShell Execution Policy (Required for Conda to run in PS)
# Without this, PowerShell will block the Conda initialization script.
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
