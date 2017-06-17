var templateTableFaces = Handlebars.compile( $('#templateTableFaces').html());
var templateFace = Handlebars.compile( $('#templateFace').html());
var templateMatches = Handlebars.compile( $('#templateMatches').html());

function loadFacesPage() {
  var faceid = getParameterByName('faceid');
  
  if (faceid) {
    $('#divTableFaces').hide();
    $('#divFace').show();
    $('#divMatches').show();
    loadFace(faceid);
    loadMatches(faceid);
  } else {
    $('#divTableFaces').show();
    $('#divFace').hide();
    $('#divMatches').hide();
    loadFaces();
  }
}

function loadFace(faceid) {
  var dynamodbdoc = new AWS.DynamoDB.DocumentClient();
  var params = {
    TableName: "CelebrityFaces",
    KeyConditionExpression: "FaceId = :faceidVal",
    ExpressionAttributeValues: { ':faceidVal': faceid}
  };
  dynamodbdoc.query(params, function(err, data) {
    if (err) {
      console.log(err, err.stack); // an error occurred
      $('#divFace').html('Unable to download data');
    } else {
      var tdata = { face: data.Items[0] };
      var html = templateFace(tdata);
      $('#divFace').html(html);
    }
  });
}

function loadMatches(faceid) {
  var dynamodbdoc = new AWS.DynamoDB.DocumentClient();
  var params = {
    TableName: "CelebrityFaceMatches",
    FilterExpression: "FaceIdSearch = :faceidVal OR FaceIdTarget = :faceidVal",
    ExpressionAttributeValues: { ':faceidVal': faceid }
  };
  dynamodbdoc.scan(params, function(err, data) {
    if (err) {
      console.log(err, err.stack); // an error occurred
      $('#divMatches').html('Unable to download data');
    } else {
      var tdata = { matches: data.Items };
      var html = templateMatches(tdata);
      $('#divMatches').html(html);
    }
  });
}

function loadFaces() {
  var dynamodbdoc = new AWS.DynamoDB.DocumentClient();
  var params = {
    TableName: "CelebrityFaces"
  };
  dynamodbdoc.scan(params, function(err, data) {
    if (err) {
      console.log(err, err.stack); // an error occurred
      $('#divTableFaces').html('Unable to download data');
    } else {
      var tdata = { faces: data.Items };
      var html = templateTableFaces(tdata);
      $('#divTableFaces').html(html);
    }
  });
}



window.onload = loadFacesPage;
