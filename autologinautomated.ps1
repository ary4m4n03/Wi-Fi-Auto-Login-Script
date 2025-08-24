# CONFIG
# URL
$loginPageUrl = "Enter_URL_here"

# Login credentials
$username = 'Enter_Username'
$password = 'Enter_Password'

# SCRIPT
# Handle SSL Certificate pop-ups
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }

# Handle HTTP Authentication pop-up
$credential = New-Object System.Management.Automation.PSCredential($username, (ConvertTo-SecureString $password -AsPlainText -Force))

try {
    # Get Session Cookie
    $response = Invoke-WebRequest -Uri $loginPageUrl -Credential $credential -SessionVariable portalSession -UseBasicParsing

    # Parse Form Data
    $htmlContent = $response.Content
    $postUrlMatch = [regex]::Match($htmlContent, 'action="([^"]+)"')
    $postUrl = $postUrlMatch.Groups[1].Value
    if ($postUrl -notlike 'http*') {
        $baseUri = New-Object System.Uri($loginPageUrl)
        $postUrl = "$($baseUri.Scheme)://$($baseUri.Host)$postUrl"
    }

    $body = @{}
    $inputRegex = '<input .*?>'
    [regex]::Matches($htmlContent, $inputRegex) | ForEach-Object {
        $nameMatch = [regex]::Match($_.Value, 'name="([^"]+)"')
        $valueMatch = [regex]::Match($_.Value, 'value="([^"]+)"')
        if ($nameMatch.Success) {
            $body[$nameMatch.Groups[1].Value] = $valueMatch.Groups[1].Value
        }
    }

    $body['userId'] = $username
    $body['password'] = $password

    # Define Browser Headers
    $headers = @{
        'Referer' = $loginPageUrl
        'User-Agent' = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36"
    }

    # Submit Final Request
    Invoke-WebRequest -Uri $postUrl -Credential $credential -WebSession $portalSession -Method 'POST' -Body $body -Headers $headers -UseBasicParsing

}
catch {
    # If errors occur this block will run
}
