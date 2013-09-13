$(document).ready(function(){
  $('#newExpenseForm').on('click', function(){
    $.get("/expenses/new", function(response){
      $('#myModal').html(response);
      $('#myModal').addClass('small');
      $('#myModal').foundation('reveal', 'open');
    });
  });

  $('#newPaymentForm').on('click', function(e){
    e.preventDefault();
    $.get($(this).attr('href'), function(response){
      $('#myModal').html(response);
      $('#myModal').addClass('small');
      $('#myModal').foundation('reveal', 'open');
    });
  });

  $('.toggleExpenseFlip').on('click', function(){
    $('.flip-container').toggleClass('flip');
  });
});