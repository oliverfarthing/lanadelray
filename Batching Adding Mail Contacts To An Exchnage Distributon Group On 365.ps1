connect-exchangeonline
$Contacts = Import-CSV C:\temp\c6.csv
$contacts | ForEach {Set-Contact $_.Name -Company $_.Company}