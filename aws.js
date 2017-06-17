var awsIdentityPoolId = 'us-east-1:13515960-0a63-40df-bec5-ba1512f59d0e';
var awsRegion = 'us-east-1';


AWS.config.region = awsRegion; // Region
AWS.config.credentials = new AWS.CognitoIdentityCredentials({
    IdentityPoolId: awsIdentityPoolId,
    });

