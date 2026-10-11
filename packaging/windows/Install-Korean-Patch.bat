@echo off
chcp 65001 >nul
rem Korean translation mod (Enhanced + Vanilla Plus Korean patch) by kairess:
rem   https://github.com/kairess/bb-enhanced-vanillaplus-korean
rem It is downloaded from the author's own GitHub release into mods\ (it is not redistributed here).
cd /d "%~dp0"
echo 한글 패치를 원저작자(kairess)의 GitHub 릴리스에서 받아 mods 폴더에 설치합니다.
echo https://github.com/kairess/bb-enhanced-vanillaplus-korean
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$ErrorActionPreference='Stop';" ^
  "[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12;" ^
  "$r=Invoke-RestMethod -Headers @{'User-Agent'='bloodborne_pc_kr'} 'https://api.github.com/repos/kairess/bb-enhanced-vanillaplus-korean/releases/latest';" ^
  "$a=$r.assets | Where-Object { $_.name -like '*.zip' } | Select-Object -First 1;" ^
  "if (-not $a) { throw 'zip asset not found in the latest release' };" ^
  "$zip=Join-Path $env:TEMP $a.name;" ^
  "Write-Host ('Downloading ' + $a.name + ' (' + $r.tag_name + ')');" ^
  "Invoke-WebRequest -UseBasicParsing -Headers @{'User-Agent'='bloodborne_pc_kr'} $a.browser_download_url -OutFile $zip;" ^
  "New-Item -ItemType Directory -Force 'mods' | Out-Null;" ^
  "Expand-Archive -Force $zip 'mods';" ^
  "Remove-Item $zip;" ^
  "Write-Host 'Installed into mods\'"
if errorlevel 1 (
    echo.
    echo 설치하지 못했습니다. 위 링크의 Releases에서 zip을 받아 mods 폴더에 직접 풀어 주세요.
) else (
    echo.
    echo 설치했습니다. 게임 언어는 English로 두세요. Mods ^& patches 페이지에서 켜고 끌 수 있습니다.
)
pause
