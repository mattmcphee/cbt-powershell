#What are modules?
#A module contains additional functionality not present in the base version of powershell.

#Where are modules hosted as a repository?
#PSGallery

#What is the cmdlet to install a module?
Install-Module -Name PSWindowsUpdate -Force -AllowClobber

#What does the -Force parameter do?
#Installs no matter what. Agrees to any terms, disk space usage to install etc.

#What does the -AllowClobber parameter mean?
#The installed module will overwrite any module with the same name

#What commmand gets the repositories powershell is currently connected to?
Get-PSRepository

#How would you add a repository? E.g. to install a module not available on PSGallery?
Register-PSRepository #changes default repository used with install-module etc.

#How do you find modules?
Find-Module -Name "*PowerCLI*" | Format-Table -AutoSize

#What command is used to import modules into powershell?
Import-Module

#What are the different ModuleTypes?
#manifest: a .psd1 file containing info describing the module's use and functionality
#script: a .psm1 file with a collection of cmdlets written in powershell
#binary: a .dll file compiled from another prog language like C# .NET that is compiled against the powershell libraries