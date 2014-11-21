// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  $( "a" ).click(function() {
    var twitterHandle = $( this )[0].innerHTML;
    $( this )[0].data( subscriptionName, twitterHandle );
  });
});
