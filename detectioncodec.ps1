if (Test-Path -Path "$env:LOCALAPPDATA\Procore Technologies\Procore Drive\Procore DriveUninstaller.exe") {
    Write-Host "Found it!"
}
elseif (Test-Path -Path "C:\Program Files (x86)\Procore Technologies\Procore Drive\Procore DriveUninstaller.exe") {
Write-Host "Found it!"
}
