#requires -Modules ScheduledTasks
#requires -Version 3.0

$TaskName = 'SampleTask2'
$filePath = "$env:HOMEPATH\\winpractice\\scripts\\18\\sample2.txt"
$time = (Get-Date).addMinutes(1).ToString("HH:mm:ss")
$Trigger = New-ScheduledTaskTrigger -Once -At $time
$Action= New-ScheduledTaskAction -Execute "notepad" -Argument "$filePath" 
Register-ScheduledTask -TaskName $TaskName -Trigger $Trigger -Action $Action
