#requires -Modules ScheduledTasks
#requires -Version 3.0

$TaskName = 'Break'
$filePath = "$env:HOMEPATH\\winpractice\\scripts\\18\\breaktime.ps1"
$time = (Get-Date).addMinutes(2).ToString("HH:mm:ss")
$Trigger = New-ScheduledTaskTrigger -Once -At $time
$Action= New-ScheduledTaskAction -Execute "pwsh.exe " -Argument "-ExecutionPolicy Bypass $filePath" 
Register-ScheduledTask -TaskName $TaskName -Trigger $Trigger -Action $Action
