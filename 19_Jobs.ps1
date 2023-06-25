#What are Jobs in PowerShell?
#A job is some code you would like to have run in the background - freeing up
#the terminal to use for other tasks.
Start-Job -ScriptBlock {
    $i = 1
    while($true) {
        $i
        $i++
        Start-Sleep 1
    }
}

#How do you get info about all jobs running?
Get-Job *

#How do you stop a job running?
Stop-Job -Name jobName

#How do you 'check in' on a job to see what it's been doing?
Receive-Job -Name jobName
#This loads any data and output into the terminal from the background job.

#What's a common parameter to use to run a cmdlet as a job?
-AsJob

