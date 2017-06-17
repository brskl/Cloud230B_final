var imageTemplate = Handlebars.compile( $('#imageTemplate').html());
var facesTemplate = Handlebars.compile( $('#facesTemplate').html());

function loadImagePage() {
  var fileid = getParameterByName('fileid');
  
  if (fileid) {
    var dynamodbdoc = new AWS.DynamoDB.DocumentClient();

    var params = {
      TableName: "CelebrityImageFiles",
      KeyConditionExpression: "FileId = :fileidVal",
      ExpressionAttributeValues: { ':fileidVal': fileid}
    };
    dynamodbdoc.query(params, function(err, data) {
      if (err) {
        console.log(err, err.stack); // an error occurred
        $('#divImageTemplate').html('Unable to download data');
      } else {
        var tdata = { imagefile: data.Items[0] };
        var html = imageTemplate(tdata);
        $('#divImageTemplate').html(html);
        scanFaces(fileid);
      }
    });
  } else {
    $('#divImageTemplate').html('Query parameter "fileid" not specified');
  }
}

function scanFaces(fileid) {
  var params = {
    TableName: "CelebrityFaces",
    FilterExpression: "FileId = :fileidVal",
    ExpressionAttributeValues: { ':fileidVal': fileid}
  };
  var dynamodbdoc = new AWS.DynamoDB.DocumentClient();
  dynamodbdoc.scan(params, function(err, data) {
    if (err) {
      console.log(err, err.stack); // an error occurred
      $('#divFacesTemplate').html('Unable to download data');
    } else {
      var tdata = { faces: data.Items };
      var html = facesTemplate(tdata);
      $('#divFacesTemplate').html(html);
    }
  });
}

window.onload = loadImagePage;