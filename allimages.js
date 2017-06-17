var tableAllTemplate = Handlebars.compile( $('#tableAllTemplate').html());

function loadAllPage() {
  var dynamodbdoc = new AWS.DynamoDB.DocumentClient();

  var params = {
    TableName: "CelebrityImageFiles"
  };
  dynamodbdoc.scan(params, function(err, data) {
    if (err) {
      console.log(err, err.stack); // an error occurred
      $('#divTableAll').html('Unable to download data');
    } else {
      var tdata = { imagefiles: data.Items };
      var html = tableAllTemplate(tdata);
      $('#divTableAll').html(html);
    }
  });
}

window.onload = loadAllPage;