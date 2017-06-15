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
                    onSuccessIndexFaces(data);
                }
            });
        }
    });
    callback(null, `Successfully processed ${event.Records.length} records.`);
};

function onSuccessIndexFaces(data) {
    console.log('NumFaces', data.FaceRecords.length);
    if (data.FaceRecords.length == 0) {
        console.log("Zero faces");
        return;
    } else {
        var imageId = data.FaceRecords[0].Face.ImageId;
        var fileId = data.FaceRecords[0].Face.ExternalImageId;
        console.log("Faces:", imageId, ' ', fileId);
    }
}