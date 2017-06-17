// setup CelebrityFaces project

// create S3 bucket
aws s3 mb s3://brsklar-celebrity-images

// initialize website
aws s3 website s3://brsklar-celebrity-images/

// upload image 
aws s3 cp <filename> s3://brsklar-celebrity-images
// make readable to everyone
aws s3api put-object-acl --acl public-read --bucket brsklar-celebrity-images --key <file> 

// create tables
aws dynamodb create-table --table-name CelebrityImageFiles --attribute-definitions AttributeName=FileId,AttributeType=S --key-schema AttributeName=FileId,KeyType=HASH --stream-specification --stream-specification StreamEnable=true,StreamViewType="NEW_AND_OLD_IMAGES" 
aws dynamodb create-table --table-name CelebrityFaces --attribute-definitions AttributeName=FaceId,AttributeType=S --key-schema AttributeName=FaceId,KeyType=HASH --stream-specification StreamEnable=true,StreamViewType="NEW_AND_OLD_IMAGES"
aws dynamodb create-table --table-name CelebrityFaceMatches --attribute-definitions AttributeName=FaceIdSearch,AttributeType=S AttributeName=FaceIdTarget,AttributeType=S --key-schema AttributeName=FaceId,KeyType=HASH AttributeName=FaceIdTarget,KeyType=RANGE

// create Rekognition collection
aws rekognition create-collection --collection-id brsklar-celebrity-images

// create roles for Cognito identity pool (PROBLEM what to put in AssumeRolePolicyDocument)
aws iam create-role --role-name Cognito_BrsklarCelebrityImagesAuth_Role
aws iam create-role --role-name Cognito_BrsklarCelebrityImagesUnauth_Role 
// add policies
aws iam attach-role-policy --role-name Cognito_BrsklarCelebrityImagesAuth_Role --policy-arn arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess 
aws iam attach-role-policy --role-name Cognito_BrsklarCelebrityImagesUnauth_Role --policy-arn arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess 

// create Cognito identity pool for unauth user access
aws cognito-identity create-identity-pool --identity-pool-name BrsklarCelebrityImages --allow-unauthenticated-identities
// set roles
aws cognito-identity set-identity-pool-roles --identity-pool-id us-east-1:13515960-0a63-40df-bec5-ba1512f59d0e 
--roles <value>
