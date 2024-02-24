
$FilePath = 'C:\Temp'
$FileName = 'ODVFernwartung.exe'
$URL = 'https://get.teamviewer.com/odvfernwartung'

function Download_TeamViewerQS() {
    $IEBrowser = New-Object -ComObject InternetExplorer.Application
    $IEBrowser.Navigate($URL)
    Start-Sleep -Seconds 3
    $CustomTVQS_URL = $IEBrowser.Document.getElementById('MasterBodyContent_btnRetry').href
    Start-BitsTransfer -Source $CustomTVQS_URL -Destination "$FilePath\$FileName"
}

& {(New-Object -ComObject "Wscript.Shell").Popup("ODV Fernwartung wird gestartet....",2,"ODV Fernwartung",0)}
if(!(Test-Path "$FilePath\$FileName")) {
    New-Item -Path "$FilePath" -ItemType Directory -ErrorAction SilentlyContinue | Out-Null
    Download_TeamViewerQS
}
& Start-Process "$FilePath\$FileName"
