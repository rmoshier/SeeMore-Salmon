  // // instagram //
  // $(function () { $(".choose").click(function (e) {
  //     e.preventDefault();
  //     var div = $(this).parents(".club");
  //     var url = $(this).parents("form").attr("action");
  //     var d = $(".info").val();
  //     $.ajax(url, {
  //       type: "POST",
  //       success: function (data) {
  //         div.addClass("chosen"); },
  //       error: function () {
  //           alert("ERROR");},
  //       data: d,
  //       });
  //     });
  //   });

  // github //

  $(function() {
    $(".choose_github").click(function(event){
      event.preventDefault();
      // select the (grand)parent div of 'this' with a class of club
      // add a class of 'chosen' to that div
      var $club = $(this).parents(".result");
      var $form = $(this).parents("form");
      var name = $(".github_name").val();
      var id = $(".github_id").val();
      var provider = $(".github_provider").val();
      // need to set data to be a hash.


      // $("club row").toggleClass("chosen"); - can't do this because it will select all club rows in the file
      $.ajax($form.attr("action"), {
        type: "POST",
        success: function () {
          $club.addClass("github_chosen");
        },
        error: function () {
          alert("ERROR");
        },
        data: {
          // names here need to be the same as the params on the other end
          username: name,
          uid: id,
          provider: provider
        }
      });
    });
  });
