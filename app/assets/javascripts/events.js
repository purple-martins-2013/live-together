$(document).ready(function(){
  $('#newExpenseForm').on('click', function(){
    $.get("/expenses/new", function(response){
      $('#myModal').html(response);
      $('#myModal').foundation('reveal', 'open');
    });
  });
});