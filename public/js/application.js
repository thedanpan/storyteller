$(document).ready(function() {

  $('form.new_comment').on('submit', function(event) {
    event.preventDefault();
    $("#spinner").show();
    var $form = $(event.target);

    $.ajax({
      type: $form.attr("method"),
      url: $form.attr("action"),
      data: $form.serialize()
    }).done(function(response) {
      // append response to beginning of comment list
      $(event.target).closest('.comments').children('.comment_list').append("<li>" + response + "</li>")
      // reset form field values after submitting successfully
      $(event.target)[0].reset();
    });
  });

});
