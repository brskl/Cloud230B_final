var awsIdentityPoolId = 'us-west-2:e54b8065-3251-4b47-8990-b305983ba0da';
var awsRegion = 'us-west-2';

AWS.config.region = awsRegion; // Region

function setUnauthenticatedUserCredentials() {
  var params = {
    IdentityPoolId: awsIdentityPoolId,
    };
  AWS.config.credentials = new AWS.CognitoIdentityCredentials(params);
}