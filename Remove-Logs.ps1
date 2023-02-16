<#
    .SYNOPSIS
        Removes files older than a given date in a specifc folder
        Setup  1..100 | ForEach-Object {$_ | Set-Content "C:\demo\Paul\Current\$_.log"}
    .EXAMPLE
        C:\demo\Paul\Remove-Logs.ps1 -Verbose
#>
[CmdletBinding()]
param
(
    [System.IO.DirectoryInfo] $Path = "C:\demo\Paul\Current"
    ,
    [Int32] $DaysOld = 2
) #param
process
{
    [DateTime] $StartTime = (Get-Date)
    Write-Verbose ("{0} {1}" -f $StartTime,"Starting")
    Write-Verbose ("Path = ({0})" -f $Path)
    Write-Verbose ("DaysOld = ({0})" -f $DaysOld)
    $DaysAgoCutoff = $StartTime.AddDays(-2)
    $Message = ("Files older than ({0}) will be deleted" -f $DaysAgoCutoff)
    Write-Verbose $Message 
    $message | Out-File C:\demo\Paul\log.log -Append
    Write-Verbose ("Files older than ({0}) will be deleted" -f $DaysAgoCutoff)
    Write-Verbose ("Files older than ($DaysAgoCutoff) will be deleted")
    $FilesToProcess = Get-ChildItem $Path -File | Where-Object {$_.LastWriteTime -lt $DaysAgoCutoff}
    Write-Verbose ("There are ({0}) files" -f $FilesToProcess.Count)
    $FilesToProcess | Remove-Item 
} # process