

$(function () { $(".choose").click(function (e) {
      e.preventDefault();
      var div = $(this).parents(".club");
      var url = $(this).parents("form").attr("action");
      var d = $(".info").val();
      $.ajax(url, {
      type: "POST",
      success: function (data) {
        div.addClass("chosen"); },
      error: function () {
          alert("ERROR");},
      data: {feed_uid: d},
        });
      });
    });
