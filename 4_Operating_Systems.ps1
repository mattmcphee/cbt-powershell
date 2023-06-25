#How do you get the current location path?
Get-Location #also written in the terminal

#How do you change the current location?
Set-Location

#How do you use the stack to manage location history?
Push-Location #pushes the current location onto the stack and moves into the specified location
Pop-Location #pops the last pushed location off the stack and moves back to that location
#This way, the stack is used as a file location history for convenient navigation through the file system.

#How do relative file paths work?
./ #this is the current directory
../ #this is the parent directory
./foldername/ #this is inside a folder in the current directory. The folder is named "foldername"
../parentfolder/ #this is stepping back into the parent directory and then going inside a folder called parent folder
#all of these are RELATIVE to the current directory e.g. if the current directory changes, these relative paths refer to different places (or not found uh oh)

#What does the -Recurse parameter do for Get-ChildItem?
#Get-ChildItem will retrieve a list of files and directories from the specified path
#it will then run Get-ChildItem again INSIDE any directories it finds and list that directories contents
#it will run Get-ChildItem again for however many directories it finds (recursion)

#How do you filter for which files get returned by Get-ChildItem?
Get-ChildItem -Filter #specify a filter string to easily return files ending in a certain filename or starting with etc.

#How do you create a new directory or file?
New-Item -ItemType File -Path #where do you want it?

#How do you copy or move a file or folder?
Copy-Item -Path -Destination #specify path to the thing you want to copy and the destination
Move-Item -Path -Destination #specify path to the thing you want to move and destination (item will be copied and then the original will be deleted)

#How do you permanently nuke a file or folder?
Remove-Item #*dangerous*

#What about move to recycle bin for a safer deletion?
#There's unfortunately no way to do this with the base version of powershell
Install-Module -Name Recycle -Force -AllowClobber
#The Recycle module provides a Remove-ItemSafely cmdlet which will put items in the recycle bin. Nice.

#generate some dummy files
$i = 1..5
foreach ($item in $i) {
    New-Item -Path ./ -ItemType File -Name "$item.blah"
}

#any item ending in .blah -> remove item to recycle bin
Get-ChildItem -Path ./ -Filter "*.blah" | Remove-ItemSafely 