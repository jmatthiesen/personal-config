$ShedService = New-Object -comobject "Schedule.Service"
$ShedService.Connect()

# Schedule the cleanup script to run every minute as SYSTEM
$Task = $ShedService.NewTask(0)
$Task.RegistrationInfo.Description = "dark mode"
$Task.Settings.Enabled = $true
$Task.Settings.AllowDemandStart = $false

$Trigger = $Task.Triggers.Create(7)
$Trigger.Enabled = $true
$Trigger.Repetition.Interval="PT10M"

$Action = $Task.Actions.Create(0)
$Action.Path = "PowerShell.exe"
$Action.Arguments = "Set-ExecutionPolicy Bypass -Scope Process -Force; C:\Windows\Resources\Themes\themeB.theme"

$TaskFolder = $ShedService.GetFolder("\")
$TaskFolder.RegisterTaskDefinition("DarkMode", $Task , 6, "Users", $null, 4)