// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= validations
//= require_tree .


$("#submit_post").live("click",function() {
  //get textarea text and maxlength attribute value
  /*var t = $(this);
  var text = t.val();
  //var limit = t.attr('maxlength');
  //if textarea text is greater than maxlength limit, truncate and re-set text
  if (text.length > 100) {
    text = text.substring(0, 100);
    alert("validations working");
    t.val(text);
  } */
  if( !validate_content_length($("#content_text").val()))
  {
       alert("Javascript is enabled, Javascript validation is working");
    return false;
  }
});