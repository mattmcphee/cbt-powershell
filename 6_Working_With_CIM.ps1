#What is CIM?
#CIM is the Common Information Model. A way of working with information that describes a computer's operating system etc.

#What is the difference between CIM and WMI?
#WMI is the Windows Management Instrumentation. A similar way of managing data describing the computer and operating system.
#WMI was the old way that was used. It was built specifically for Windows. CIM is the new open standard that is cross platform. Nice.

#How do you see all the CIM data for the current environment?
Get-CimClass #there's a lot!

#What does Get-CimInstance do?
#Officially it retrieves a CimInstance from a CimServer.
#This means that the Get-CimInstance cmdlet can retrieve any info you need - you just need to know the name of the Cim Class

#How to search for a Cim Class
Get-CimClass | Where-Object CimClassName -like "*network*" #this searches for class names with the word network anywhere in the name

#How to retrieve all the items within a Cim Class
Get-CimInstance -ClassName Win32_NetworkAdapterSetting | Select-Object *
#some of these will be heavily nested -> use select (Select-Object) to pick out what you need

