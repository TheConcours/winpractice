$srcDir = "$env:USERPROFILE\winpractice\data"
$destDir = "$env:USERPROFILE\winpractice\backup"

Write-Output " [ $((Get-Date).ToString('yyyy/MM/dd HH:mm:ss')) ] Backup started."

$fail = 0

# Executing backup
# Getting the Object[] of files
$srcItems = Get-ChildItem -Path $srcDir -Recurse

foreach ($Item in $srcItems) {
    $destItem = $Item.FullName.Replace($srcDir, $destDir)
    if (Test-Path ($destItem)){
        if(Test-Path $destItem -OlderThan $Item.LastWriteTime){
            try{
                Copy-Item $Item.FullName -Destination $destItem -Force -Recurse -ErrorAction Stop
            } catch{
                Write-Output "$ ($item.FullName) Failed to copy."
                $fail++
            }
        }
    }else{
            try{
                Copy-Item $Item.FullName -Destination $destItem -Force -Recurse -ErrorAction Stop
            } catch{
                Write-Output "$ ($item.FullName) Failed to copy."
                $fail++
            }
    }
}

if ($fail -gt 0) {
    Write-Output "$fail Item(s) Failed to copy."
}


Write-Output " [ $((Get-Date).ToString('yyyy/MM/dd HH:mm:ss')) ] Backup ended."
