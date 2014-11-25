$(function() {
  $(".choose").click(function(event){
    event.preventDefault();


    $.ajax($(this).attr("action"), { //data-action
      type: "POST",
      success: function() {
        club.addClass("chosen");
      },
      error: function() {
        alert("ERROR!!");
      }
    });
  });


});


var club = $(this).parents(".club"); //#what the method was called on in the first place. ALSO finding the one related to this button.
var $form = $(this).parents("form");
