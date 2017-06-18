var templateName = Handlebars.compile( $('#templateName').html());
var templateTableNames = Handlebars.compile( $('#templateTableNames').html());
var templateTableFaces = Handlebars.compile( $('#templateTableFaces').html());

function loadNamesPage() {
  var nameid = getParameterByName('nameid');
  
  if (nameid) {
    $('#divTableNames').hide();
    $('#divName').show();
    $('#divTableFaces').show();
    loadName(nameid);
  } else {
    $('#divTableNames').show();
    $('#divName').hide();
    $('#divTableFaces').hide();
    loadNames();
  }
}

function loadNames() {
  var dynamodbdoc = new AWS.DynamoDB.DocumentClient();
  var params = {
    TableName: "CelebrityFaces",
    Select: 'SPECIFIC_ATTRIBUTES',
    AttributesToGet: [ 'Name' ],
    ScanFilter : {'Name': { ComparisonOperator: 'NOT_NULL' }}
  };
  dynamodbdoc.scan(params, function(err, data) {
    if (err) {
      console.log(err, err.stack); // an error occurred
      $('#divTableNames').html('Unable to download data');
    } else {
      var namesT = data.Items;
      namesT.sort(function(a, b){return a.Name.localeCompare(b.Name)});
      var tdata = { names: array_unique_name(namesT) };
      var html = templateTableNames(tdata);
      $('#divTableNames').html(html);
    }
  });
}

function loadName(nameid) {
  var tdata = { Name: nameid };
  var html = templateName(tdata);
  $('#divName').html(html);
}

function array_unique_name(arr) {      
  var ret = [arr[0]];       
  // Start loop at 1 as element 0 can never be a duplicate
  for (var i = 1; i < arr.length; i++) { 
    if (arr[i-1].Name !== arr[i].Name) {              
      ret.push(arr[i]);             
    }       
  }
  return ret;   
}





window.onload = loadNamesPage;
