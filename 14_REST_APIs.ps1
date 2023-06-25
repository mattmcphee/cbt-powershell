#We can use
Invoke-WebRequest
#To retrieve the raw data that a web server gives us
#But a better cmdlet to use when working with REST APIs is
Invoke-RestMethod
#This automatically converts the JSON into PowerShell for us. Sick!

#Let's get some data from an API
$apiUrl = "https://swapi.dev/api/"
$endpoint = "planets"

$response = Invoke-RestMethod -Uri "$apiUrl$endpoint" -Method Get -ResponseHeadersVariable rHeader -StatusCodeVariable status

#if status code is 200 (successful), show me the response we got back
#else show me the response headers so I can diagnose what went wrong!
if ($status -eq 200) {
    $response
} else {
    $rHeader
}

#we got some results! now we can do stuff with them
$response.results | Format-List #lightning fast retrieval time over the web! APIs are amazing!

#POST requests are a little different
#we need to provide headers that let the web server know what data format our data is coming in as
#and a body with the content we want to add to the web server
$url = "https://postman-echo.com/post"

$headers = @{
    "Accept" = "application/json"
    "Content-Type" = "application/json"
}

$payload = @{
    "firstName" = "Matt"
    "lastName" = "McPhee"
    "Description" = "My name"
}

$postResponse = Invoke-RestMethod `
-Uri $url `
-Method Post `
-Headers $headers `
-Body ($payload | ConvertTo-Json) `
-ResponseHeadersVariable rHeaders `
-StatusCodeVariable status

if ($status -eq 200) {
    Write-Host "Succeeded."
    $postResponse
} else {
    Write-Host "Failed."
    $rHeaders
}

$postResponse.json #Invoke-RestMethod auto-converts all response data from the webserver as PowerShell objects ready to use in the pipeline
#We only have to convert our objects to Json when we want to send it to the server