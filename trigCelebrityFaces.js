'use strict';

console.log('Loading function');
var AWS = require("aws-sdk");
var rekognition = new AWS.Rekognition();

const RKG_COL = process.env.faceCollection;

exports.handler = (event, context, callback) => {
    var params = {
        CollectionId: RKG_COL,
        FaceId: '69875313-f0f8-501a-a07f-9f35f43307ef',
        FaceMatchThreshold: 70.0
    };
    rekognition.searchFaces(params, function(err, data) {
        if (err) {
            console.log(err, err.stack);
        } else {
            putMatches(data);
        }
    });
}

function putMatches(searchData) {
    console.log('Matches', searchData.FaceMatches.length);
    var searchedFaceId = searchData.SearchedFaceId;
    for (let faceMatch of searchData.FaceMatches) {
        putMatch(searchedFaceId, faceMatch);
    }
}

function putMatch(searchedFaceId, faceMatch) {
    var faceId = faceMatch.Face.FaceId;
    var similarity = faceMatch.Similarity;
  
    var params = {
        TableName : 'CelebrityFaceMatches',
        Item: {
            FaceIdSearch: searchedFaceId,
            FaceIdTarget: faceId,
            Similarity: similarity
        },
        ConditionExpression: "attribute_not_exists(FaceIdSearch)",
        ReturnConsumedCapacity: "TOTAL"
    };
  
    var documentClient = new AWS.DynamoDB.DocumentClient();
    documentClient.put(params, function(err, data) {
        if (err) {
            console.log(err);
        } else {
            console.log(data);
        }
    });
}
