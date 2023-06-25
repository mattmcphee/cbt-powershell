#We need a URL for the file we want to download
$fileURL = "http://speedtest.tele2.net/1MB.zip"
$output = "./1MB.zip"

#What cmdlet downloads the file?
Invoke-WebRequest -Uri $fileURL -OutFile $output #super easy!