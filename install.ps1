#Create install directory.
New-Item -Path "c:\" -Name "tempmimecast" -ItemType "directory" -force
#Get mimecast installer.
Invoke-WebRequest "https://601905.app.netsuite.com/core/media/media.nl?id=138573912&c=601905&h=cpHZsyktFe1XO9dka6shNzIUxxqxHqdXpXUsd35C5HrG47b_&_xt=.zip" -OutFile "c:\tempmimecast\Mimecast for outlook 7.10.1.133 (x64).zip"
Start-Sleep -Seconds 30
#Extract installer.
Expand-Archive -LiteralPath "c:\tempmimecast\Mimecast for outlook 7.10.1.133 (x64).zip" -DestinationPath C:\tempmimecast -force
Start-Sleep -Seconds 5
#Close all outlook processes.
Stop-Process -Force -Name "outlook"
#Start the installer.
msiexec -i "C:\tempmimecast\Mimecast for outlook 7.10.1.133 (x64).msi" -quiet
Start-Sleep -Seconds 5
#Clean up the installer.
Remove-Item -Path "c:\tempmimecast" -Recurse