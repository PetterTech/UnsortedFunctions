function Get-Pwnage
    {
        [CmdletBinding()] 
            Param (
                [Parameter(Mandatory=$True,Position=0)][string]$Emailaddress,
                [Parameter(Mandatory=$True,Position=1,)][string]$APIkey,
                [switch]$Allinfo
                  )
    Begin {
        $Header = @{
            "hibp-api-key" = "d5c3ff76ac974191a7209cbfa7c9548d"
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
  Short description
 .Description
  Long description
 .Parameter Parameter1
  Info about Parameter1
 .Example
  verb-noun
  Describe what verb-noun does
 .Example
  verb-noun -Parameter1 something
  Describe what verb-noun -Parameter1 something does
 .Link
  http://cloud.kemta.net
 #>
}