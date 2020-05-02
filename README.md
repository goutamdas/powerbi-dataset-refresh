PREREQUISITES:

1. Install Azure PowerShell on the top of Windows PowerShell on your system.

    Reference: https://docs.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-3.8.0

2. Go to https://portal.azure.com/. Then, App registrations -> Owned Application -> Your-App -> Authentication. Click on both 'ID tokens' & 'Access tokens' checkbox.
	We are doing this because in the powershell script, we have used "scope" = "openid"


Now, in the dataset-refresh.ps1 script, update the first 5 lines with proper details. Then run this script from the PowerShell command line:

       PS> .\dataset-refresh.ps1 (enter)
