#PowerShell can't work with SQL with the base version - need module.
#Which module? SqlServer
if (!(Get-InstalledModule SqlServer)) {
    Install-Module SqlServer
} else {
    Write-Host "`nSqlServer already installed.`n"
}