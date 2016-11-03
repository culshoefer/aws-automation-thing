$.ajaxSetup({
  data: {csrfmiddlewaretoken: '{{ csrf_token }}' },
});

$('#signup-btn').on('click', function(e){
    e.preventDefault();
    var data = {
      "name": $('#name').val(),
      "email": $('#email').val(),
      "password": $('#password').val()
    }
    console.log(data);
    $.ajax({
      type: 'POST',
      url: '/register_user',
      data: data,
      success: function(data) {
        console.log("this runs", data);
        if (data.success) {
          window.location = "/login";
        } else {
          window.onerror = function(msg, url, line, col, error) {
             alert("Error: " + msg + "\nurl: " + url + "\nline: " + line);
          };
        }
      },
      error: function(data){
        console.log(data);
      }
    });
  });

var password = document.getElementById("password")
var confirm_password = document.getElementById("confirm_password");

function validatePasswordMatch(){
  if(password.value != confirm_password.value) {
    confirm_password.setCustomValidity("Passwords Don't Match");
  } else {
    confirm_password.setCustomValidity('');
  }
}

password.onchange = validatePasswordMatch;
confirm_password.onkeyup = validatePasswordMatch;
