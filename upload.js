(function() {
'use strict';
  
  
  $('#imgUpload').hide();
  $('#btnUpload').hide();
  $('#btnCancel').hide();
  
  $.myOnSubmitUpload = function(evt) {
    console.log('Submit pressed');
    evt.preventDefault();
  
    var formUpload = $('form#formUpload')[0];
    var imgurl = formUpload.url.value.trim();
    console.log('URL:' + imgurl);
    

    $('#imgUpload').attr('src', imgurl);

    $('form#formUpload').hide();
    $('#imgUpload').show();
    $('#btnUpload').show();
    $('#btnCancel').show();
  
  }
  


  //=============================================================================
})();