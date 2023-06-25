#How do we use the File Transfer Protocol in PowerShell?
if (!(Get-InstalledModule PSFtp)) {
    Install-Module PSFtp -Force
} else {
    Write-Host "PSFtp is already installed."
}

$ftpServer = "ftp://test.rebex.net/"

#Must provide credentials. If no username and pw required, then "anonymous" and "anonymous" for un and pw.
$user = "demo"
$PWord = ConvertTo-SecureString -String "password" -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $user,$PWord

#What command from PSFtp connects to an ftp server?
#Set-FTPConnection sets up the connection details
Set-FTPConnection -Server $ftpServer -Session s -Credentials $Credential
#Get-FTPConnection uses the details we set to create an FTP server connection
#it provides us with a session key we use to verify with the server that we are 'connected'
$session = Get-FTPConnection -Session s

Get-FTPChildItem -Session $session -Path "/pub/example/"

#Download the readme.txt from this ftp server
Get-FTPItem -Path "/readme.txt" -Session $session

#Upload a file to this ftp server
Add-FTPItem -Path "/" -LocalPath ".\readme.txt" -Session $session