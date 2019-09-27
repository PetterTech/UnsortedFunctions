function verb-noun
    {
        [CmdletBinding()] 
            Param (
                [Parameter(Mandatory=$True,Position=0,HelpMessage='Lorem Ipsum')][string]$Mandatoryparameter,
                [string]$Presetparameter = 'value',
                [string]$StringParameter,
                [ValidateScript({Get-MsolPartnerContract -DomainName $_})][string]$ValidatedParameter,
                [int]$IntegerParameter,
                $WeeklyTypedParameter,
                [switch]$Switch
                  )
    Begin {
	
        }

    Process {
        code
        }

    End {
	
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