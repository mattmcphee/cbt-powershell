#What is the syntax of the range operator?
1..10 #this is an array containing the integers 1 to 10 INCLUSIVE of 1 AND 10

#Why is this useful?
#It's just a quick shortcut to create a collection of things in sequence
array[20..50] #this retrieves a subset array out of a bigger array
[char]'A'..[char]'Z' #this returns the uppercase alphabet chars
10..1 #can go in reverse direction
1kb..1mb #can go in storage sizes
1..10 | ForEach-Object {} #can quickly generate a number of times to iterate something