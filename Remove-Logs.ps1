<#
    .SYNOPSIS
        Removes files older than a given date in a specifc folder
    .EXAMPLE
        C:\demo\Paul\Remove-Logs.ps1 -Verbose
#>
[CmdletBinding()]
param
(

) #param
process
{
    Write-Verbose ("{0} {1}" -f (Get-Date),"Starting")
} # process