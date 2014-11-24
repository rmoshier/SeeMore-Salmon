
$(function() {
  $(".choose").click(function(event){
    event.preventDefault();

    $( this ).addClass( "subscribed" );  //#what the method was called on in the first place. ALSO finding the one related to this button.

    });
  });
