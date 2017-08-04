var stripeResponseHandler;

$(function(){
  $('#charge-form').submit(function(event) {
    var $form;
    $form = $(this);
  
    $form.find('button').prop('disabled', true);
    Stripe.card.createToken($form, stripeResponseHandler);
    event.preventDefault();
  });
});

stripeResponseHandler = function(status, response) {
  var $form, token;
  $form = $('#charge-form');
  if (response.error) {
    $form.find('.charge-errors').text(response.error.message);
    $form.find('button').prop('disabled', false);
  } else {
    token = response.id;
    $form.append($('<input type="hidden" name="stripeToken" />').val(token));
    $form.get(0).submit();
  }
};
