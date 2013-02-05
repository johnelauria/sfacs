$(document).observe('dom:loaded', function(){

  // Select all textboxes and assign them to an array
  var textboxes = $$('form.awesome input.input-text');

  // Iterate through all textboxes in the form
  textboxes.each(function(input, index){
		
    var label = input.previous();

    // TimedObserver to check for autocomplete	
    if (index == 0){
      new Form.Observer(input.up('form'), 0.1, function(form, value) {
        textboxes.each(function(inputX){
          if (!inputX.value.empty()) {
            inputX.previous().addClassName('hastext');
          }
        });
      });
    }

    // Fade the label back when a field gains focus		
    input.onfocus = function(){
      if (input.value.empty()){
        label.addClassName('focus');            
      }
    }

    // Check if a field is empty when the user switches out
    input.onblur = function(){
      if (input.value.empty()){
        label.removeClassName('focus').removeClassName('hastext');          
      }
    }

    // Fade the label back if a field has text		
    if (!input.value.empty()) {
      label.addClassName('hastext');
    }

    // Fade the label back when the user starts to type		
    input.onkeypress = function(){
      label.addClassName('hastext');
    };
  });
});