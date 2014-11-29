//= require jquery
//= require jquery_ujs
//= require bootstrap/dist/js/bootstrap
//= require perfect-scrollbar/min/perfect-scrollbar.min
//= require bootstrap-datepicker/js/bootstrap-datepicker
//= require chartjs/Chart

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

  $("[data-provide='datepicker']").each(function(i, el){
      $(el).datepicker({format:'yyyy-mm-dd'});
  })

  $("[data-provide='scrollable']").each(function(i, el){
    $(el).perfectScrollbar();
    $(el).addClass("scrollable");
  });

  $("[data-toggle='checkbox']").each(function(i, el){
    var $checkbox = $(el).find("input[type='checkbox']")

    $(el).click(function(){
      $checkbox.prop("checked", !$checkbox.prop("checked"))
    });

    $($checkbox).click(function(e){
      e.stopImmediatePropagation();
    });
  });


});
