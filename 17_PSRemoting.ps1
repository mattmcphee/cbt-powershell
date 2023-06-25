#How do you remotely connect to a machine with PS?
Enter-PSSession -HostName pcname

#How do you exit a PSSession?
Exit-PSSession

#How do you run a block of commands on a remote machine without having to
#enter PSSession?
Invoke-Command -ComputerName pcname -ScriptBlock {"Code to execute"}

#What's the major difference between these?
<#
With Enter-PSSession we are assuming direct control of the machine including
the PowerShell pipeline that currently exists on that machine.
With Invoke-Command we do not get access to the machine's pipeline and use
the current machine's pipeline.
#>

