Write-Host "Starting script to get all checked out files in a SharePoint Online site"

m365 setup --scripting --output none
m365 login --authType identity --output none

Write-Host "`nGetting all document libraries in the site`n"

$siteURL = "https://thejasey.sharepoint.com/sites/CLIDemo"

$allLibs = m365 spo list list --webUrl $siteURL --filter "BaseTemplate eq 101" | ConvertFrom-Json

foreach ($library in $allLibs) {
  m365 spo file list --webUrl $siteURL --folderUrl $library.Url --recursive --filter "CheckOutType eq 0" --fields "Name,ServerRelativeUrl,TimeLastModified" --output md
}

Write-Host "`nScript completed"