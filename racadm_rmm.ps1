$racadmPath = "C:\Program Files\Dell\SysMgt\iDRACTools\racadm\racadm.exe"

$OSInfo = Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object Manufacturer, Model

if ($OSInfo -contains "Dell Inc."){

}
else {
    Write-Host "Not Dell, Exciting"
}

if (Test-Path -Path $racadmPath -IsValid) {
    Write-Host "The application executable exists."
} else {
    Write-Host "The application executable was not found."
}