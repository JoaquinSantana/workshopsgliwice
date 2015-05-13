//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
  $('.read_more').click(function(e){
    e.preventDefault();

    $(this).closest('.product_item').find('.product_more').fadeToggle();
    $(this).find('i').toggleClass("fa-angle-double-down fa-angle-double-up");
  });

  $('#review_content').focus();
  $('#product_title').focus();
});