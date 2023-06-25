#How do you get a user?
Get-ADUser -Identity username

#How do you get groups?
Get-ADGroup -Filter 'Name -eq "share_bne_common"'

#How do you create a new OU?
New-ADOrganizationalUnit -Name "NewGroup" `
-Path "OU=Users,OU=Accounts,DC=nuggetlab,DC=com"

#How do you create a new group?
New-ADGroup -Name "sp_prd1_project_121-2093" -SamAccountName appAdmins `
-DisplayName "121-2093" -GroupScope Global -GroupCategory Security `
-Path "OU=NewGroups,OU=Users,DC=nuggetlab,DC=com"

#How do you add a member to a group?
Add-ADGroupMember -Identity appAdmins -Members TESTES1

#How do you view the contents of the AD drive?
Get-ChildItem AD: #you can then specify AD:\OU=**** to browse the various OUs

