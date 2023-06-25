if (!(Get-InstalledModule PowerHtml)) {
    Install-Module PowerHtml
} else {
    Write-Output "PowerHtml is already installed."
}

#Invoke-WebRequest cmdlet is used to make requests to a web server
$site = Invoke-WebRequest -Uri "https://www.cbtnuggets.com"

#$site.Content #this is very difficult to parse and pull out specific things
#We need to EXTEND PowerShell with a module to help us with this.
#The module is called PowerHtml (installed at the top of this script)

$site.Content | Out-File -FilePath "./cbtnuggers.html" #output into this html file

#PowerHtml can convert Html into PowerShell objects so we can work with it programmatically.
$html = ConvertFrom-Html -Path "./cbtnuggers.html"
$html.SelectNodes('//script')

