#Function syntax
function DoSomething {
    param(
        [string]$FirstName = "Joe",
        [string]$LastName
        #in this case, the FirstName parameter is a default parameter, 
        #defaulting to Joe
    )

    #code to execute
}

#Advanced function syntax
function New-AdvancedFunction {
    [CmdletBinding()] #adds parameters like -Verbose
    param(
        [Parameter(Mandatory=$true)] #throw error if parameter not provided
        $FirstName
    )

    dynamicparam {
        #define dynamic parameters here
        #these dynamic parameters only get used when certain conditions are met
        #define the conditions here also
    }

    #begin, process and end are used when defining how the function works
    #with the pipeline
    begin {
        #code in here is executed exactly 1 time right at the start of the
        #function
        #the begin block is optional.
        #typically used for initializing objects, arrays, connections etc.
    }
    
    process {
        #code in here is run once for each object that is piped in to the
        #function
        #the process block is mandatory if objects are allowed to be piped in
    }
    
    end {
        #similar to the begin block.
        #code in here is executed exactly 1 time as the very last thing that
        #gets executed.
        #the end block is optional.
        #typically used for cleanup tasks like closing connections etc.
    }
}