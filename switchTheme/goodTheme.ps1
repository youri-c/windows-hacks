function Set-LightTheme {
    # Use Windows 10's Light theme
    Write-Host "Setting Light theme"
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d 1 /f
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d 1 /f
}

function Set-DarkTheme {
    # Use Windows 10's Dark theme
    Write-Host "Setting Dark theme"
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d 0 /f
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d 0 /f
}

$currentTime = Get-Date
$startTime = Get-Date -Hour 6 -Minute 0 -Second 0
$endTime = Get-Date -Hour 20 -Minute 0 -Second 0

if ($currentTime -ge $startTime -and $currentTime -lt $endTime) {
    Set-LightTheme
} else {
    Set-DarkTheme
}

taskkill /f /IM explorer.exe
start explorer.exe