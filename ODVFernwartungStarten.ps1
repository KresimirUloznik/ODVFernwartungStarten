#Variables
$FilePath = 'C:\Temp'
$FileName = 'ODVFernwartung.exe'
$URL = 'https://get.teamviewer.com/odvfernwartung'

#Functions
function Download_TeamViewerQS() {
    $IEBrowser = New-Object -ComObject InternetExplorer.Application
    $IEBrowser.Navigate($URL)
    Start-Sleep -Seconds 3
    $CustomTVQS_URL = $IEBrowser.Document.getElementById('MasterBodyContent_btnRetry').href
    Start-BitsTransfer -Source $CustomTVQS_URL -Destination "$FilePath\$FileName"
}

#Code
if(!(Test-Path "$FilePath\$FileName")) {
    New-Item -Path "$FilePath" -ItemType Directory -ErrorAction SilentlyContinue | Out-Null
    Download_TeamViewerQS
}
& Start-Process "$FilePath\$FileName"
