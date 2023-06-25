#How to retrieve a list of files from a directory
Get-ChildItem -Path $filePath

#How to get the properties of a file object
Get-ChildItem -Path $filePath | Get-Member -MemberType Property

#What is the syntax of a calculated property? $_ is the current object variable
@{name='calculatedProperty';expression={$_.ExampleProperty * 2}}

#How to select which properties get displayed?
Select-Object -Property ExampleProperty

#How to filter out which properties get displayed based on a certain condition?
Where-Object -Property Name -eq 'Example' #can use any number of things

#How to filter using multiple conditions?
Where-Object -FilterScript {$_.Name -eq 'Example' -and $_.Length -gt 1000} #use the FilterScript parameter

#How to sort results?
Sort-Object -Property Name #defaults to sort ascending. Can sort based on wide range of things.

#How to output results in a table?
Format-Table -AutoSize #Automatic Sizing parameter makes it look nice

#How to test a filepath exists before performing file operations using pipes?
Get-Item -Path $filePath -ErrorAction SilentlyContinue ||
    New-Item -Path $filePath -ItemType Directory #this action will get performed if the path does not exist