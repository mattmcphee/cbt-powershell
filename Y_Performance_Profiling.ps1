#A good way to measure the performance of your script is to use the stopwatch in System.Diagnostics.Stopwatch
#This is a test to see how long pipeline loops take (pipeline processes objects sequentially)
$stopwatch = [System.Diagnostics.Stopwatch]::StartNew() #stopwatch starts

$result = 1..2000000 | ForEach-Object {
    "Item #$_."
}

'Pipelined through {0} items in {1:n3} seconds' -f $result.Count, $stopwatch.Elapsed.TotalSeconds

#foreach loop performance test

$stopwatch = [System.Diagnostics.Stopwatch]::StartNew() #stopwatch starts

$result = foreach ($_ in 1..2000000) {
    "Item $_."
}

'Looped through {0} items in {1:n3} seconds' -f $result.Count, $stopwatch.Elapsed.TotalSeconds

#The second test was about 6 times faster on my gaming rig

#for loop performance test
$stopwatch = [System.Diagnostics.Stopwatch]::StartNew() #stopwatch starts

$result = for ($i = 0; $i -lt 2000000; $i++) {
    "Item $_."
}

'Looped through {0} items in {1:n3} seconds' -f $result.Count, $stopwatch.Elapsed.TotalSeconds
#for loop took around twice the amount of time as the foreach loop

#BUT there is a way to add the power of PARALLELIZATION to the pipeline loop cmdlet
$stopwatch = [System.Diagnostics.Stopwatch]::StartNew() #stopwatch starts

$result = 1..10000 | ForEach-Object -Parallel {
    "Item $_."
} #-ThrottleLimit allows you to pick how many items get processed at once (defaults to 5)

'Parallel pipelined through {0} items in {1:n3} seconds' -f $result.Count, $stopwatch.Elapsed.TotalSeconds
#But hang on... that's way slower, wtf?
#Well that's because to set up parallel looping requires additional overhead in the form of setting up multiple 'runspaces'
#each loop it has to take extra steps to set this up, making it way slower to perform simple iteration tasks
#where parallel pipeline looping shines is performing tasks like remote connection to many computers and other specialized situations
#if in doubt, go with sequential and test parallel A LOT before deploying

#What cmdlet can you use instead of the stopwatch to measure code performance?
Measure-Command {
    foreach ($_ in 1..2000000) {
        "Item $_."
    }
}