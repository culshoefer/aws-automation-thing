$.ajaxSetup({
  data: {csrfmiddlewaretoken: '{{ csrf_token }}' },
});

$('#signup-btn').on('click', function(){
    console.log("1")
    $.ajax({
      type: 'POST',
      url: '/register_user',
      data: {
        "name": $('#name').val(),
        "email": $('#email').val(),
        "password": $('#password').val()
      },
      success: function(data){
        console.log("this runs")
        if (data.success == true){
        	window.location= "/login";
          console.log('hey bbby');
        } else {
          window.onerror = function(msg, url, line, col, error) {
             alert("Error: " + msg + "\nurl: " + url + "\nline: " + line);
          };
        }
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
