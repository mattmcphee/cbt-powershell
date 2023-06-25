#Which module is required to work with Azure?
Install-Module Az

#How do you connect to your Azure Account?
Connect-AzAccount

#How do you view your subscriptions?
Get-AzSubscription
$sub = Get-AzSubscription | Where-Object { $_.Name -like "Azure*" } | 
Select-AzSubscription | Format-List

$sub

#How do you select a subscription to work with?
Select-AzSubscription

#How are Azure services grouped?
#Azure services are first grouped into subscriptions.
#Within these subscriptions are Resource Groups - these can contain only VMs or 
#only websites etc.
#Within these Resource Groups are the actual Resources.

#How do you view Resource Groups?
Get-AzResourceGroup 
#Whenever you want to 'get' a resource you must specify which Resource Group to
#look in

#How do you create a Resource Group?
New-AzResourceGroup -Name "MadeWithPowerShell" `
-Location 'Australia East' #press ctrl+space to load the different regions

#Let's have a look at the Resource Group we just created:
$rg = Get-AzResourceGroup | Where-Object { $_.ResourceGroupName -like "Made*" } |
Select-Object *

#What do we need to create a VM?
#We need the Resource Group name to put it in. Best to have the RG object in a 
#variable.
$rg

#What are the two ways to create an AzureVM with PowerShell?
#You can use the quick and easy way and only specify certain basic options and
#a lot of defaults will be used
#or you can specify all the different options like networking, disk management
#but both ultimately this cmdlet to create the VM:
New-AzVM

#Let's create a VM now the easy way:
New-AzVM -Name PowerVM -ResourceGroupName $rg.ResourceGroupName `
-Location 'Australia East' -Image Ubuntu2204 -Credential (Get-Credential)
#brackets means this operation happens first and can use the credential in the
#cmdlet

#How do you get info about a AzVM?
$powerVM = get-AzVM -Name PowerVM -ResourceGroupName $rg.ResourceGroupName
#This retrieves an PSVirtualMachine object
$powerVM = get-AzVM -Name PowerVM -ResourceGroupName $rg.ResourceGroupName |
Select-Object * #this retrieves a PSCustomObject with additional info!
#Some properties are Microsoft.***.*Profile objects themselves.
#These object hold additional info and settings etc. about the OS, storage etc.
$powerVM = get-AzVM -Name PowerVM -ResourceGroupName $rg.ResourceGroupName `
-Status | Select-Object *
#if we provide the -Status parameter switch, the object now provides info about
#the VMs status and version etc.
$powerVM.Statuses
#.Statuses provides handy info about provisioning status, the status code and 
#display status

Get-AzVM -Name PowerVM -ResourceGroupName $rg.ResourceGroupName |
Stop-AzVM -Force -NoWait #NoWait parameter makes the operation happen in the 
#background and doesn't 'lock' the terminal until the operation completes

#What is an Azure VNet?
#Microsoft's cloud virtual network.

#How do you get info about a VNet?
$vnet = Get-AzVirtualNetwork -ResourceGroupName $rg.ResourceGroupName
$vnet.Subnets | Format-List

