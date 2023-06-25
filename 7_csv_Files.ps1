#How do you export some data returned from a cmdlet into a csv file?
Get-Service | Export-Csv -Path ".\dummy.csv"

#How do you import this data back into the PowerShell?
$dummyCsv = Import-Csv -Path ".\dummy.csv"

#We can then use this data to pull out and work with certain things
$dummyCsv | Where-Object {$_.ServiceName -like "*Display*"}