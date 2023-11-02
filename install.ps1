Start-Transcript -Path "$($env:TEMP)\IntuneSignatureManagerForOutlook-log.txt" -Force

# Install NuGet Package Provider
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Scope CurrentUser -Force

# Install AzureAD module to retrieve the user information
Install-Module -Name AzureAD -Scope CurrentUser -Force

# Leverage Single Sign-on to sign into the AzureAD PowerShell module
$SecurePassword = ConvertTo-SecureString -String "hRQ8Q~_FKG6OYxfRI82Xfsibqr7sT35BWlmw2cQ8" -AsPlainText -Force
$TenantId = '87784b47-763d-40de-8597-1b51337c6468'
$ApplicationId = '2c61d34f-0b64-4569-9c77-ab733202983e'
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $ApplicationId, $SecurePassword
Connect-AzAccount -ServicePrincipal -TenantId $TenantId -Credential $Credential 

# Get the user information to update the signature
$userObject = Get-AzureADUser -ObjectId (Get-AzureADCurrentSessionInfo).Account.Id -erroraction silentlycontinue

# Get all signature files
$signatureFiles = Get-ChildItem -Path "$PSScriptRoot\Signatures"

foreach ($signatureFile in $signatureFiles) {
    if ($signatureFile.Name -like "*.htm" -or $signatureFile.Name -like "*.rtf" -or $signatureFile.Name -like "*.txt" -or $signatureFile.Name -like "*.html") {
        # Get file content with placeholder values
        $signatureFileContent = Get-Content -Path $signatureFile.FullName

        # Replace placeholder values
        $signatureFileContent = $signatureFileContent -replace "%DisplayName%", $userObject.DisplayName
        $signatureFileContent = $signatureFileContent -replace "%GivenName%", $userObject.GivenName
        $signatureFileContent = $signatureFileContent -replace "%Surname%", $userObject.Surname
        $signatureFileContent = $signatureFileContent -replace "%Mail%", $userObject.Mail
        $signatureFileContent = $signatureFileContent -replace "%Mobile%", $userObject.Mobile
        $signatureFileContent = $signatureFileContent -replace "%TelephoneNumber%", $userObject.TelephoneNumber
        $signatureFileContent = $signatureFileContent -replace "%JobTitle%", $userObject.JobTitle
        $signatureFileContent = $signatureFileContent -replace "%Department%", $userObject.Department
        $signatureFileContent = $signatureFileContent -replace "%City%", $userObject.City
        $signatureFileContent = $signatureFileContent -replace "%Country%", $userObject.Country
        $signatureFileContent = $signatureFileContent -replace "%StreetAddress%", $userObject.StreetAddress
        $signatureFileContent = $signatureFileContent -replace "%PostalCode%", $userObject.PostalCode
        $signatureFileContent = $signatureFileContent -replace "%Country%", $userObject.Country
        $signatureFileContent = $signatureFileContent -replace "%State%", $userObject.State
        $signatureFileContent = $signatureFileContent -replace "%PhysicalDeliveryOfficeName%", $userObject.PhysicalDeliveryOfficeName

        # Set file content with actual values in $env:APPDATA\Microsoft\Signatures
        Set-Content -Path "$($env:APPDATA)\Microsoft\Signatures\$($signatureFile.Name)" -Value $signatureFileContent -Force
    } elseif ($signatureFile.getType().Name -eq 'DirectoryInfo') {
        Copy-Item -Path $signatureFile.FullName -Destination "$($env:APPDATA)\Microsoft\Signatures\$($signatureFile.Name)" -Recurse -Force

    }
}

Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Outlook\Profiles\*\9375CFF0413111d3B88A00104B2A6676\00000002' -Name 'New Signature' -Value Winvic2022 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Outlook\Profiles\*\9375CFF0413111d3B88A00104B2A6676\00000002' -Name 'New Signature' -Value Winvic2022 -Force
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Outlook\Setup' -Name "DisableRoamingSignaturesTemporaryToggle" -Value "1"  -PropertyType "DWord" -Force
Remove-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Outlook\Profiles\*\9375CFF0413111d3B88A00104B2A6676\00000002' -Name 'Reply-Forward Signature' -Force -ErrorAction Ignore


Stop-Transcript