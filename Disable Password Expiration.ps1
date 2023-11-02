$ObjectID = read-host -prompt 'AzureAD ObjectID'

Connect-AzureAD
Set-AzureADUser -ObjectId $ObjectID -PasswordPolicies DisablePasswordExpiration