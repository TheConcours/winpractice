[System.Media.SystemSounds]::Asterisk.Play()
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
$notify = new-object system.windows.forms.notifyicon
$notify.icon = [System.Drawing.SystemIcons]::Information
$notify.visible = $true
$endTime =  (Get-Date).addMinutes(10).ToString("HH:mm")
$notify.showballoontip(600,"10 mins break","Till $endTime",[system.windows.forms.tooltipicon]::None)
