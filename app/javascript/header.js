$(function() {
  var $modal = $('#modal-menus-show');
  $('.fa-th, .fa-times').on('click', function() {
    if ($modal.is(':visible')) {
      $modal.fadeOut();
      $('.container').css('display', 'block');
      $('.profile-container').css('display', 'flex');
      $('.fa-th').fadeIn();
      $('.fa-times').fadeOut();
    } else {
      $modal.fadeIn();
      $('.container').css('display', 'none');
      $('.profile-container').css('display', 'none');
      $('.fa-th').fadeOut();
      $('.fa-times').fadeIn();
    }
  })
})