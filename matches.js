var templateTableMatches = Handlebars.compile( $('#templateTableMatches').html());
var templateMatch = Handlebars.compile( $('#templateMatch').html());
var templateFace = Handlebars.compile( $('#templateFace').html());

function loadMatchesPage() {
  var faceids = getParameterByName('faceids');
  var faceidt = getParameterByName('faceidt');
  
  if (faceids && faceidt) {
    $('#divTableMatches').hide();
    $('#divMatch').show();
    $('#divSearch').show();
    $('#divTarget').show();
    loadMatch(faceids, faceidt);
    loadFace('#divSearch', "Face Search", faceids);
    loadFace('#divTarget', "Face Target", faceidt);
  } else {
    $('#divTableMatches').show();
    $('#divMatch').hide();
    $('#divSearch').hide();
    $('#divTarget').hide();
    loadMatches();
  }
}

function loadMatches() {
  var dynamodbdoc = new AWS.DynamoDB.DocumentClient();
  var params = {
    TableName: "CelebrityFaceMatches"
  };
  dynamodbdoc.scan(params, function(err, data) {
    if (err) {
      console.log(err, err.stack); // an error occurred
      $('#divTableMatches').html('Unable to download data');
    } else {
      var tdata = { matches: data.Items };
      var html = templateTableMatches(tdata);
      $('#divTableMatches').html(html);
    }
  });
}

function loadMatch(faceids, faceidt) {
  var dynamodbdoc = new AWS.DynamoDB.DocumentClient();
  var params = {
    TableName: "CelebrityFaceMatches",
    FilterExpression: "FaceIdSearch = :faceidsVal AND FaceIdTarget = :faceidtVal",
    ExpressionAttributeValues: { ':faceidsVal': faceids, ':faceidtVal': faceidt }
  };
  dynamodbdoc.scan(params, function(err, data) {
    if (err) {
      console.log(err, err.stack); // an error occurred
      $('#divMatch').html('Unable to download data');
    } else {
      var tdata = { match: data.Items[0] };
      var html = templateMatch(tdata);
      $('#divMatch').html(html);
    }
  });
}

function loadFace(div, title, faceid) {
  var dynamodbdoc = new AWS.DynamoDB.DocumentClient();
  var params = {
    TableName: "CelebrityFaces",
    KeyConditionExpression: "FaceId = :faceidVal",
    ExpressionAttributeValues: { ':faceidVal': faceid}
  };
  dynamodbdoc.query(params, function(err, data) {
    if (err) {
      console.log(err, err.stack); // an error occurred
      $(div).html('Unable to download data');
    } else {
      var tdata = {Title: title, face: data.Items[0]};
      var html = templateFace(tdata);
      $(div).html(html);
    }
  });
}


window.onload = loadMatchesPage;
