#PowerShell does not come with support for working with Excel files in base version
#What module lets us work with Excel files?
#The ImportExcel module.
if (!(Get-InstalledModule -Name ImportExcel)) {
    Install-Module -Name ImportExcel
} else {
    Write-Host "Module installed."
}

Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object * | Export-Csv ".\myPC.csv"

$csvs = Get-ChildItem -Path "./" -Filter "*.csv"

foreach ($csv in $csvs) {
    Import-Csv -Path $csv.FullName | Export-Excel -Path "./$($csv.BaseName).xlsx"
}

Import-Excel -Path "./myPC.xlsx"