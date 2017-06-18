var templateTableMatches = Handlebars.compile( $('#templateTableMatches').html());
var templateMatch = Handlebars.compile( $('#templateMatch').html());

function loadMatchesPage() {
  var faceids = getParameterByName('faceids');
  var faceidt = getParameterByName('faceidt');
  
  if (faceids && faceidt) {
    $('#divTableMatches').hide();
    $('#divMatch').show();
    loadMatch(faceids, faceidt);
  } else {
    $('#divTableMatches').show();
    $('#divMatch').hide();
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


window.onload = loadMatchesPage;
