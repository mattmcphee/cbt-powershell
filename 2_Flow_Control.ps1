#What is the syntax of an elseif statement?
if (3 -eq 4) {
    #these actions get executed if the condition evaluates to true
} elseif (5 -eq 4) {
    #these actions get executed if the secondary condition evaluates to true
} else {
    #these actions get executed if the condition evaluates to $false e.g. a catch all
}

#What is the syntax of a switch statement?
$exampleVar = 1
switch ($exampleVar) { #switch is executed on the value of a variable, then conditions are listed along with the code block to execute if condition is true
    1 { 'One' }
    Default { 'Unknown' }
}

#How do you break out of a switch statement?
;break #use the break keyword

#How do you use wildcard conditions in a switch statement?
switch -Wildcard ($exampleVar) {Default{}} #use the -Wildcard parameter

#How do you pass a file object to a switch statement?
switch -File ($file) {Default{}} #use the -File parameter

#What are the other parameters for a switch statement and why are they used?
#-Exact parameter is for exact string matching -CaseSensitive for case sensitive string matching and -Regex for using the Regex syntax to perform pattern matching

#Can you put multiple conditions on one line of a switch?
#Yes, by using -or, -and to join chain conditions together

#What is the syntax of a foreach loop?
foreach ($currentItemName in $collection) {
    #$currentItemName is the current item in the collection -> iterating to the next each loop
}

#What is a collection?
#A grouping of items, typically an array, list or object

#What is the cmdlet for a foreach loop?
ForEach-Object { Write-Host $_.Name } #typical use case is to pipe an input object into the ForEach cmdlet

#What is the syntax of a For loop?
for ($i = 0; $i -lt $array.Count; $i++) { 
    #this code block gets executed as long as condition is true
    #if condition is false, exit out of for loop and execute rest of script
    #first is the initial value, 
    #second is the condition to stop iterating and 
    #third is how much to increase the initial value by after each iteration
}

#What's the typical reason to use a For loop?
#The for loop gives you more fine-grained control over which items in a collection you'd like to perform operations on

#What is the syntax of a while loop?
while ($conditionIsTrue) {
    #execute this code block
    #at the end of the code block, make sure you add a line that moves the condition one step closer to being true
    #otherwise you'll get stuck in an infinite loop!
}

#Why is a while loop useful?
#It's useful when you don't know how many times you need to iterate through something - you just know when to stop

#What is the syntax of a do-while loop?
do {
    #this action will always be executed at least one time
    #after the first time, will check if condition is true and run again
} while ($conditionIsTrue)

#What is the syntax of a do-until loop?
do {

} until ($conditionIsTrue)

#What's the difference between a do-while and a do-until loop?
#do-while will execute the block of code as long as the condition is true
#do-until will execute the block of code as long as the condition is false
#as soon as the condition becomes true, it will exit the loop
#both loops execute the code block at least one time