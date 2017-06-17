var templateTableFaces = Handlebars.compile( $('#templateTableFaces').html());
var templateFace = Handlebars.compile( $('#templateFace').html());

function loadFacesPage() {
  var faceid = getParameterByName('faceid');
  
  if (faceid) {
    $('#divTableFaces').hide();
    $('#divFace').show();
        var tdata = { FaceId: faceid };
        var html = templateFace(tdata);
        $('#divFace').html(html);
  } else {
    $('#divTableFaces').show();
    $('#divFace').hide();
    var dynamodbdoc = new AWS.DynamoDB.DocumentClient();
    var params = {
      TableName: "CelebrityFaces",
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
}



window.onload = loadFacesPage;