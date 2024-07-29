function Get-VMList {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
        [string]
        $Server,

        [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
        [string]
        $Credential,

        [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
        [string]
        $Filter
    )

    begin {
        Write-Verbose "Ingesting Credentials of $Credential into variable"
        $Creds = Get-Credential("$Credential")

        Write-Verbose "Connecting to vCenter Server - $Server"
        Connect-VIServer -Server $Server -Credential $Creds | Out-Null
    }

    process {
        Write-Verbose "Collect list of matching VM's into an Object"
        $Results = Get-VM | Where-Object { $_.Name -like "$Filter" }

        Write-Verbose "Return the array object"
        Return $Results
    }

    end {
        Write-Verbose "Disconnect from vCenter Server - $Server"
        Disconnect-VIServer -Server $Server -Force -Confirm:$False

        Write-Verbose "Cleaning up used Variables"
        Remove-Variable -Name "Server" -ErrorAction SilentlyContinue
        Remove-Variable -Name "Credential" -ErrorAction SilentlyContinue
        Remove-Variable -Name "Filter" -ErrorAction SilentlyContinue
        Remove-Variable -Name "Creds" -ErrorAction SilentlyContinue
        Remove-Variable -Name "Results" -ErrorAction SilentlyContinue
    }
}
