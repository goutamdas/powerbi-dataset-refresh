i$clientId = "YOUR-CLIENT-ID"
$datasetId = "YOUR-DATASET-ID"
$groupId = "YOUR-GROUP-ID"
$tenantId = "YOUR-TENANT-ID"
$clientSecret = "YOUR-CLIENT-SECRET"

$body = @{
    "grant_type" = "client_credentials";
    "scope" = "openid"
    "resource" = "https://analysis.windows.net/powerbi/api";
    "client_id" = $clientId;
    "client_secret" = $clientSecret
    }

#$authUrl = "https://login.windows.net/common/oauth2/token/"
$authUrl = "https://login.microsoftonline.com/$tenantId/oauth2/token"
$authResponse = Invoke-RestMethod -Uri $authUrl –Method POST -Body $body


$headers = @{
             "Content-Type" = "application/json";
             "Authorization" = $authResponse.token_type + " " +
                                $authResponse.access_token
           }

# properly format groups path
$groupsPath = ""
if ($groupID -eq "me") {
    $groupsPath = "myorg"
} else {
    $groupsPath = "myorg/groups/$groupID"
}

# Refresh the dataset
$restUrl = "https://api.powerbi.com/v1.0/$groupsPath/datasets/$datasetID/refreshes"
$restResponse = Invoke-RestMethod -Uri $restUrl –Method POST -Headers $headers -Body $body
