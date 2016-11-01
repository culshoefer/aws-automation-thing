$('#signup-btn').on('click', function(){
    console.log("1")
    $.ajax({
      type: 'POST',
      url: '/authenticate/',
      data: {
        "name": $('#name').val(),
        "email": $('#email').val(),
        "password": $('#password').val()
      },
      success: function(data){
        if (data.success == true){
        	window.location= "/login";
        } else {
          window.onerror = function(msg, url, line, col, error) {
             alert("Error: " + msg + "\nurl: " + url + "\nline: " + line);
          };
        }
      }
    })
  })

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