#What is the string interpolations syntax?
$interpolatedString = '{0}, my name is {1}, I am a {2}' -f (
    'Hello',
    'Matt',
    'Man'
    #the string variables will get dynamically inserted into the {0} placeholders
)
$interpolatedString

#Why is string interpolation useful?
#Useful for replacing parts of strings with variables that change e.g. over a loop