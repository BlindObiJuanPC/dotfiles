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

# VLC Media Player
winget install -e --id VideoLAN.VLC --scope machine --accept-package-agreements --accept-source-agreements --silent

# Greenshot
winget install -e --id Greenshot.Greenshot --scope machine --accept-package-agreements --accept-source-agreements --silent

# Screen to Gif
winget install -e --id NickeManarin.ScreenToGif --scope machine --accept-package-agreements --accept-source-agreements --silent

# Steam
winget install -e --id Valve.Steam --scope machine --accept-package-agreements --accept-source-agreements --silent

# Neovim
winget install -e --id NeoVIM.NeoVIM --scope machine --accept-package-agreements --accept-source-agreements --silent

# VS Code
winget install -e --id Anaconda.Miniconda3 --scope machine --accept-package-agreements --accept-source-agreements --silent

# Miniconda
winget install -e --id Anaconda.Miniconda3 --scope user --accept-package-agreements --accept-source-agreements --silent


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