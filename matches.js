var templateTableMatches = Handlebars.compile( $('#templateTableMatches').html());

function loadMatchesPage() {
  var faceids = getParameterByName('faceids');
  var faceidt = getParameterByName('faceidt');
  
  if (faceids && faceidt) {
    $('#divTableMatches').hide();
  } else {
    $('#divTableMatches').show();
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


window.onload = loadMatchesPage;
