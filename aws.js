var awsIdentityPoolId = 'us-east-1:13515960-0a63-40df-bec5-ba1512f59d0e';
var awsRegion = 'us-east-1';


AWS.config.region = awsRegion; // Region
AWS.config.credentials = new AWS.CognitoIdentityCredentials({
    IdentityPoolId: awsIdentityPoolId,
    });

function getParameterByName(name) {
    var url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}