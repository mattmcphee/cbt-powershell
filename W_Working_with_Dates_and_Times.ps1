#the core of working with date and time in powershell is the Get-Date cmdlet
Get-Date
#this returns a DateTime object representing the current date and time.

#we can use date formatting to output the date how we want  (use Google)
Get-Date -Format "dddd d-MMM"