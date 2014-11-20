//= require jquery
//= require jquery_ujs
//= require bootstrap/dist/js/bootstrap

$(document).ready(function(){

  // Toogle radio buttons groups
  $("[data-toggle='buttons'] .btn").each(function(i, el) {
    var $button = $(el);
    var checked = $button.find("input[type='radio']").prop("checked");
    if (checked) {
      $button.addClass("active");
    } else {
      $button.removeClass("active");
    }
  });

});
