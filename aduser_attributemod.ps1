Get-ADUser -Filter * -SearchBase 'OU=Bramptonvalley Users,OU=Winvic Users,DC=Winvic,DC=local' | Foreach-Object{
   Set-ADUser -Identity $_ -Email "$($_.Name -replace ' ', '')@bramptonvalleyhomes.co.uk"
}