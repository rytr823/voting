$(document).on('turbolinks:load', function() {
  if ($('.nested-fields').length == 1) {
  $('#remove-btn').hide();
  }
  });