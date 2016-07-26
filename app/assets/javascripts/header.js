$(document).ready(headerShowReady)
$(document).on('page:load', headerShowReady)

function headerShowReady() {

  onHeaderShowLoadReady();

};

function onHeaderShowLoadReady() {
  $("#toggle").click(function(){
    $("#tuckedMenu").toggleClass('custom-menu-tucked');
    $("#toggle").toggleClass('x');
  });
};
