function Get-VMState {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
        [array]
        $Name
    )

    begin {
        $Results = @()
    }

    process {
        $Name | ForEach-Object {
            $VM = [PSCustomObject]@{
                Name = $PSItem
                PowerState = $((Get-VM -Name $PSItem).PowerState)
                State = $((Get-VM -Name $PSItem).Guest.State)
            }

            $Results += $VM
        }

        return $Results
    }

    end {
        Write-Verbose "Cleaning up used Variables..."
        Remove-Variable -Name "Name" -ErrorAction SilentlyContinue
        Remove-Variable -Name "VM" -ErrorAction SilentlyContinue
    }
}