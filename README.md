# PowerShell VMware Tools (ps-vmtools)

Module create to include custom functions that work with VMWare's PowerCLI. For use with other cmdlets and scripts.

## Installation

Clone the repository into your **$Home\Documents\WindowsPowerShell\Modules** folder (create the Modules folder if you dont have one already)

```powershell
cd $Home\Documents\WindowsPowerShell\Modules\
git clone git@github.com:mikepruett3/ps-vmtools.git
```

Then you can import the custom module into your running shell...

```powershell
Import-Module ps-vmtools
```

## Usage

### Get-VMList

A function that connects to the specified vCenter, and retrieves a filtered list of VM's

```powershell
Get-VMList -Server "Hostname" -Credential "Username" -Filter "Partial Name to search for"
```

*Example*

```powershell
Get-VMList -Server vcenter.example.com -Credential administrator@vsphere.local -Filter "*TEMP*"
```
