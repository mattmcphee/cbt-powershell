#filter syntax
filter Get-FilterMessage {
    #think of a filter as a function with a 'built-in' for each loop for working
    #with data that is piped in.
    $_
    #$_ represents the current iteration variable it's working with
}

#let's pass an array to the above filter
@('why', 'hello', 'there') | Get-FilterMessage
#the filter simply loops through the array that got piped in and outputs the
#value of the object passed to the terminal ($_ represents the current loop var)

