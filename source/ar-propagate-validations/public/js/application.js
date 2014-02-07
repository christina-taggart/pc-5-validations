$(document).ready(function () {
  eventListeners();
  enableSubmitButton();
});

function eventListeners(){
  signOutEvent();
  createEventChange();
}

function signOutEvent(){
  $('a#sign-out').on("click", function(e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () { window.location = "/"; });
  })
}

function createEventChange(){
  $('.create_event').on("keyup", function(){
    enableSubmitButton();
  });
}

function enableSubmitButton(){
  if ($('#name').val().length > 0 &&
    $('#title').val().length > 0 &&
    $('#email').val().length > 0 &&
    validateEmail() &&
    $('#date').val().length > 0) {
    $('#createbutton').prop('disabled', false);
  }
  else
  {
    $('#createbutton').prop('disabled', true);
  }
}

function validateEmail(){
  var email = $('#email').val();
  regex = new RegExp('^.+@.+\..{2,}$');
  return regex.test(email);
}