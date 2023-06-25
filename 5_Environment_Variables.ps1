#How to get a list of all environment variables in the current environment
Get-ChildItem -Path Env:

#How to pull out the value of the USERNAME env var
$curr_username = Get-ChildItem -Path Env: | Where-Object {$_.Name -eq "USERNAME"}
Write-Host "$($curr_username.Name) : $($curr_username.Value)"

#How to create a new environment variable
$env:MyEnvVar = "MyKey"
Get-ChildItem -Path Env:MyEnvVar # see, it's now in there

#Let's create a new password env var
#We don't want to store it in source control so we'll get the password at runtime
$password = Read-Host -Prompt "Please enter your password" -AsSecureString
#Now we can turn this password into a PSCredential object
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $curr_username.Value,$password
#This PSCredential object now has a Username (matti) and Password associated
$Credential | Format-List