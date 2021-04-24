function Get-Pwnage
    {
        [CmdletBinding()] 
            Param (
                [Parameter(Mandatory=$True,Position=0)][string]$Emailaddress,
                [Parameter(Mandatory=$True,Position=1)][string]$APIkey,
                [switch]$Allinfo
                  )
    Begin {
        $Header = @{
            "hibp-api-key" = $APIkey
        }
    }

    Process {
        if ($Allinfo) {
            $Response = Invoke-RestMethod -Uri "https://haveibeenpwned.com/api/v3/breachedaccount/$($Emailaddress)?truncateResponse=false" -Method Get -Headers $Header
        }

        else {
            $Response = Invoke-RestMethod -Uri "https://haveibeenpwned.com/api/v3/breachedaccount/$($Emailaddress)" -Method Get -Headers $Header
        }
    }

    End {
        $Response
    }
    
        
<#
 .Synopsis
  Checks if given email is listed in known breaches
 .Description
  This function will query HaveIBeenPwned's API for breaches where given email is listed
 .Parameter Emailaddress
  The email address you want to check for pwnage
 .Parameter APIkey
  The api key you want to authenticate as. This needs to be purchased on https://haveibeenpwned.com
 .Parameter Allinfo
  Returns full set of info, not just the name of the breach
 .Example
  Get-Pwnage not@me.com asefasef7439567s9ga
  Queries for breaches containing not@me.com. Authenticates with the api key asefasef7439567s9ga
 .Link
  https://github.com/nerenther/UnsortedFunctions/blob/master/get-pwnage.ps1
 #>
}