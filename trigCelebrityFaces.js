'use strict';

console.log('Loading function');
var AWS = require("aws-sdk");
var rekognition = new AWS.Rekognition();

const RKG_COL = process.env.faceCollection;

exports.handler = (event, context, callback) => {
    putMatches(event);
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
            MatchId: guid(),
            FaceIdSearch: searchedFaceId,
            FaceIdTarget: faceId,
            Similarity: similarity
        },
        ConditionExpression: "attribute_not_exists(MatchId)",
        ReturnConsumedCapacity: "TOTAL"
    };
  
    console.log(params);
    var documentClient = new AWS.DynamoDB.DocumentClient();
    documentClient.put(params, function(err, data) {
        if (err) {
            console.log(err);
        } else {
            console.log(data);
        }
    });
}

function guid() {
    function s4() {
        return Math.floor((1 + Math.random()) * 0x10000)
            .toString(16)
            .substring(1);
    }
    return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
}
