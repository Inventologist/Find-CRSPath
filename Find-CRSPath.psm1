Function Find-CRSPath {
    IF ($host.name -eq 'Windows Powershell ISE Host') { #If the script is being run in ISE
        $Global:CRSPath = $psISE.CurrentFile.FullPath | Split-Path}  #Get the Directory where this script is saved, and then chop off the file name
        

    IF ($host.name -eq 'ConsoleHost') { #If the Script is being run normally
        $Global:CRSPath = Split-Path $PSCommandPath}
            
    #Error Checking
    IF ($CRSPath -eq "" -or !(Test-Path variable:global:CRSPath)) {Write-Host "Path of current running script not found... cannot continue!"}

    Write-Output $Global:CRSPath
}
