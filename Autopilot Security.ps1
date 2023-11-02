#Services
Set-Service -Name "stisvc" -StartupType disabled
Set-Service -Name "wisvc" -Status stopped -StartupType disabled
Set-Service -Name "XboxGipSvc" -Status stopped -StartupType disabled
Set-Service -Name "XblAuthManager" -Status stopped -StartupType disabled
Set-Service -Name "XblGameSave" -Status stopped -StartupType disabled
Set-Service -Name "XboxNetApiSvc" -Status stopped -StartupType disabled
Set-Service -Name "RetailDemo" -Status stopped -StartupType disabled
Set-Service -Name "WpcMonSvc" -Status stopped -StartupType disabled
Set-Service -Name "CscService" -Status stopped -StartupType disabled
Set-Service -Name "Fax" -Status stopped -StartupType disabled
Set-Service -Name "dmwappushservice" -Status stopped -StartupType disabled
Set-Service -Name "AJRouter" -Status stopped -StartupType disabled
Set-Service -Name "DiagTrack" -StartupType disabled
Set-Service -Name "SNMPTRAP" -Status stopped -StartupType disabled
Set-Service -Name "WbioSrvc" -StartupType disabled
Set-Service -Name "icssvc" -Status stopped -StartupType disabled

#Features
Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol
Get-AppxPackage Microsoft.windowscommunicationsapps | Remove-AppxPackage
Add-WindowsCapability -Online -Name NetFx3

#HKLM
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\NonEnum" -Name "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" -PropertyType DWORD -Value 1 -Force
