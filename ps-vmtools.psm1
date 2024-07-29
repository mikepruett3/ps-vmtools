#Requires -Modules VMware.VIM

$Public  = @( Get-ChildItem -Path $PSScriptRoot\Public\ -Filter *.ps1 -ErrorAction SilentlyContinue )
Import-Module -Name $PSScriptRoot\Public\*.ps1 -Function * -Verbose -ErrorAction SilentlyContinue
Import-Module -Name $PSScriptRoot\Private\*.ps1 -Function * -Verbose -ErrorAction SilentlyContinue

Export-ModuleMember -Function $Public.BaseName
