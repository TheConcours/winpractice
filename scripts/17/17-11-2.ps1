# Remember where we are now
$currentDir = (Get-Location)
# Set the data directory
$dataDir = "$env:USERPROFILE\winpractice\data"
Set-Location $dataDir
# Creating files named 1 to 100
1..100 `
| ForEach-Object {
    Write-Output "USERNAME: DTSstudentNo.$_ `nPASSWORD: password$_" | Out-File -FilePath "Miracle$_.txt"
}
Get-Content "Miracle1.txt"
Get-ChildItem | Measure-Object
Get-ChildItem `
| Select-Object FullName, CreationTime, LastWriteTime `
| Export-Csv -Path "..\FileList.csv" -NoTypeInformation
# Return where we were
Set-Location $currentDir
# Opening the csv file
Try{
    $Excel = New-object -ComObject Excel.application -ErrorAction STOP
    $Path = "$dataDir\..\FileList.csv"
    $Excel.Visible = $true
    $Excel.Workbooks.Open($Path)
}
Catch{
    $_      # just display the exception (or send it into the pipeline)
    Throw "your failure message here"    # or 'Throw $_'
}
