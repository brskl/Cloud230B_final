'use strict';

console.log('Loading function');
var AWS = require("aws-sdk");
var rekognition = new AWS.Rekognition();

const S3_SRC = process.env.srcBucket;
const RKG_COL = process.env.faceCollection;

exports.handler = (event, context, callback) => {
    //console.log('Received event:', JSON.stringify(event, null, 2));
    event.Records.forEach((record) => {
        console.log(record.eventID);
        console.log(record.eventName);
        console.log('DynamoDB Record: %j', record.dynamodb);
        if (record.eventName == 'INSERT') {
            var params = {
                CollectionId: RKG_COL, 
                ExternalImageId: record.dynamodb.NewImage.FileId.S, 
                Image: {
                    S3Object: {
                        Bucket: S3_SRC, 
                        Name: record.dynamodb.NewImage.FileId.S
                    }
                }
            };
            rekognition.indexFaces(params, function(err, data) {
                if (err) {
                    console.log(err, err.stack);
                } else {
                    onSuccessIndexFaces(params.ExternalImageId, data);
                }
            });
        }
    });
    callback(null, `Successfully processed ${event.Records.length} records.`);
};

function onSuccessIndexFaces(fileId, data) {
    var imageId;
    if (data.FaceRecords.length == 0) {
        console.log("Zero faces");
        imageId = "none";
    } else {
        imageId = data.FaceRecords[0].Face.ImageId;
        // TODO update entry in CelebrityImageFiles key=fileId with imageId
        for (let faceRecord of data.FaceRecords) {
            var params = {
                TableName : 'CelebrityFaces',
                Item: {
                    FaceId: faceRecord.Face.FaceId,
                    FileId: fileId,
                    ImageId: imageId,
                    BoundingBoxHeight: faceRecord.Face.BoundingBox.Height,
                    BoundingBoxLeft: faceRecord.Face.BoundingBox.Left,
                    BoundingBoxTop: faceRecord.Face.BoundingBox.Top, 
                    BoundingBoxWidth: faceRecord.Face.BoundingBox.Width,
                    Confidence: faceRecord.Face.Confidence
                },
                ReturnConsumedCapacity: "TOTAL"
            };
            console.log(params);
        }
    }
    // update key=fileId, imageId =<new-value>
    var params = {
        TableName: 'CelebrityImageFiles',
        ReturnValues: "ALL_NEW",
        ExpressionAttributeNames: {
            "#II": "ImageId"
        }, 
        ExpressionAttributeValues: {
            ":i": { S: imageId }
        }, 
        UpdateExpression: "SET #II = :i",
        Key: {
            "FileId": { S: fileId }
        }, 
    };
    console.log(params);
}
