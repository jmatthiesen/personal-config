[System.Environment]::SetEnvironmentVariable("VS_UNIFIED_SETTINGS_PROFILE","${WinGetConfigRoot}\..\visual-studio-settings\", "User")

# Show extensions in Windows Explorer
$path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
$propertyName = "HideFileExt"
$value = "0"

if (!(Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

Set-ItemProperty -Path $path -Name $propertyName -Value $value

# Set default font for Terminal
$winhome=$(powershell.exe -c 'Write-Host -NoNewLine  $env:userprofile' | xargs -0 wslpath)
cd ${winhome}/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState
sed -i '/"defaults"/,/fontFace/s/^\(.*fontFace": \).*/\1"CaskaydiaCove Nerd Font",/' settings.json
sed -i '/"defaults"/,/fontSize/s/\([^/]*fontSize": \)[0-9]*/\115/' settings.json

# .gitconfig settings
copy "${WinGetConfigRoot}\..\.gitconfig" "~\.gitconfig" -Force
