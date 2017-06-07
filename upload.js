(function() {
'use strict';
  
  
  $('#imgUpload').hide();
  $('#btnUpload').hide();
  $('#btnCancel').hide();
  $('form#formUpload').show();

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
  
  $.myOnClickUpload = function(evt) {
    console.log('Upload pressed');
  }

  $.myOnClickCancel = function(evt) {
    console.log('Cancel pressed');

    $('#imgUpload').attr('src', '');

    $('#imgUpload').hide();
    $('#btnUpload').hide();
    $('#btnCancel').hide();
    $('form#formUpload').show();

  }



  //=============================================================================
})();
