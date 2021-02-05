$(function() {
  var $modal = $('#modal-menus-show');
  $('.fa-align-justify').on('click', function() {
    if ($modal.is(':visible')) {
      $modal.fadeOut();
      $('.container').css('display', 'block');
    } else {
      $modal.fadeIn();
      $('.container').css('display', 'none');
    }
  })
})