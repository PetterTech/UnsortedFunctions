function Write-CustomLog {
        [CmdletBinding()] 
            Param (
                [Parameter(Mandatory=$True,Position=0)][ValidateSet("ERROR","WARNING","INFO","DEBUG")][string]$Errorlevel,
                [string]$LogFolder = $env:temp,
                [string]$LogName,
                [string]$LogText,
                [switch]$OutputToConsole
                )
    Write-Verbose "Getting time"
    $timeStamp = Get-Date -UFormat %Y%m%d-%H%M
    Write-Verbose "Got this: $($timeStamp)"

    Write-Verbose "Writing to file"
    try {
        "$($timeStamp) - $($Errorlevel): $($LogText)" | Out-File $LogFolder\$LogName -Force -Append
        Write-Verbose "Finished writing to file"
        }

    catch {
        Write-Verbose "Something went wrong"
        throw $Error[0]
        }

    if ($OutputToConsole) {
        Write-Verbose "OutputToConsole was specified, outputting text to console"
        Write-Host "$($timeStamp) - $($Errorlevel): $($LogText)"
        }
        

<#
 .Synopsis
  Writes log to file
 .Description
  Will write whatever you input to a log file
 .Parameter Errorlevel
  The criticality of the error
 .Parameter LogFolder
  Where you want the log to be stored. Defaults to temp directory
 .Parameter LogName
  Name of the folder to store the log
 .Parameter LogText
  Name of the logfile to write to
 .Parameter OutputToConsole
  Will output the same info to both file and console
 .Example
  Write-CustomLog -Errorlevel ERROR -LogName testlog.txt -LogText "Something went wrong" 
  Writes a line to testlog.txt in the temp directory with the text "Something went wrong"
 .Link
  https://github.com/nerenther/UnsortedFunctions
 #>
}