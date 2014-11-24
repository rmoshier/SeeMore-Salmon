// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  $( "a.twitter.subscribe-link" ).click(function( event ) {
    event.preventDefault();
    $( this ).addClass( "subscribed" ); 
    var twitterHandle = $( this ).innerHTML;
    // var twitterHandle = $( this )[0].innerHTML;
    // $( this )[0].data( subscriptionName, twitterHandle );
  });
});
