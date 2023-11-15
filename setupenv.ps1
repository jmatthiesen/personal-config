[System.Environment]::SetEnvironmentVariable("VS_UNIFIED_SETTINGS_PROFILE","c:\src\personal-config\visual-studio-settings\", "User")

# Show extensions in Windows Explorer
$path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
$propertyName = "HideFileExt"
$value = "0"

if (!(Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

Set-ItemProperty -Path $path -Name $propertyName -Value $value