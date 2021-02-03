$(function() {

  var $NewOrderLists = $('#new-order-lists');
  var $PriceOrderLists = $('#price-order-lists');
  var $NewOrder= $('#new-order');
  var $PriceOrder = $('#price-order');

  $PriceOrder.on('click', function() {
    $PriceOrderLists.show();
    $PriceOrder.addClass('post-background');
    $NewOrderLists.hide();
    $NewOrder.removeClass('post-background');
  })

  $NewOrder.on('click', function() {
    $PriceOrderLists.hide();
    $PriceOrder.removeClass('post-background');
    $NewOrderLists.show();
    $NewOrder.addClass('post-background');
  })
});