/* global $ Stripe */
//Document ready.
$(document).on('turbolinks:load', function(){
  
  var theForm = $('#payment-form');
  var submitBtn = $('#form-signup-btn');
  
  //Set Stripe public key.
  var stripe = Stripe($('meta[name="stripe-key"]').attr('content'));
  
  //Use JS Elements
  var elements = stripe.elements();
  
  //When user clicks form submit btn,
  submitBtn.click(function(event){
    
    //prevent default submission behavior.
    event.preventDefault();
    submitBtn.val("Processing").prop('disabled', true);
    
    //Collect the credit card fields.
    var ccNum = $('#card_number').val(),
        cvcNum = $('#card_code').val(),
        expMonth = $('#card_month').val(),
        expYear = $('#card_year').val();
        
    //Use Stripe JS library to check for card errors.
    var error = false;
    
    //Validate card number.
    if(!stripe.card.validateCardNumber(ccNum)) {
      error = true;
      alert('The credit card number appears to be invalid');
    }
    
    //Validate CVC number.
    if(!stripe.card.validateCVC(cvcNum)) {
      error = true;
      alert('The CVC number appears to be invalid');
    }
    
    //Validate expiration date.
    if(!stripe.card.validateExpiry(expMonth, expYear)) {
      error = true;
      alert('The expiration date appears to be invalid');
    }
    
    if (error) {
      
      //If there are card errors, don't send to Stripe.
      submitBtn.prop('disabled', false).val("Get ReachMe!");
    } else {
      
      //Send the card info to Stripe.
      stripe.createToken({
        number: ccNum,
        cvc: cvcNum,
        exp_month: expMonth,
        exp_year: expYear
      }, stripeResponseHandler);
    }
    
    return false;
    
  });
  
  //Stripe will return a card token.
  function stripeResponseHandler(status, response) {
    
    //Get the token from the response.
    var token = response.id;
    
    //Inject the card token in a hidden field.
    theForm.append( $('<input type="hidden" name="school_registration[stripe_card_token]">').val(token) );
    
    //Submit form to our Rails app.
    theForm.get(0).submit();
  }
});