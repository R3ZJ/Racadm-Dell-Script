$OSInfo = Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object Manufacturer, Model




$racadmPath = "C:\Program Files\Dell\SysMgt\iDRACTools\racadm\racadm.exe"
$dellUrl = "https://dl.dell.com/FOLDER12236255M/1/Dell-iDRACTools-Web-WINX64-11.3.0.0-609_A00.exe"
$tempPath = "C:\U2FsdGVkX18kwGCYT00BQooLg6cIwef9adL\Dell"
$dellExe = $tempPath + "setup.exe"
$dellPath = $tempPath + "setup.msi"
if ($OSInfo -contains "Dell Inc."){
    if (Test-Path -Path $racadmPath -IsValid) {
    Write-Host "The application executable exists."

    } else {
    Write-Host "The application executable was not found."
    If (!(Test-Path $tempPath)){ New-Item $tempPath -ItemType Directory | Out-Null }
    $error.Clear()
    Invoke-WebRequest -Uri $dellUrl -OutFile $dellExe -UseBasicParsing -ErrorAction Stop
    if ($error.Count -gt 0 -or -not (Test-Path -Path $dellExe)) {
    Write-Host "The file did not download successfully." -ForegroundColor Red
    }
    Start-Process -FilePath $dellOutput -ArgumentList "/Extract:`"$dellOutput`"" -Wait

    if (Test-Path -Path $dellPath -IsValid){

    }
    else {
        Write-Host "Not Valid Dell Path"
    }
    }
}
else {
    Write-Host "Not Dell, Exiting."
    exit 1
}

