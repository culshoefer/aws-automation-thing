// function getCookie(name) {
//       var cookieValue = null;
//       if (document.cookie && document.cookie !== '') {
//           var cookies = document.cookie.split(';');
//           for (var i = 0; i < cookies.length; i++) {
//               var cookie = jQuery.trim(cookies[i]);
//               // Does this cookie string begin with the name we want?
//               if (cookie.substring(0, name.length + 1) === (name + '=')) {
//                   cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
//                   break;
//               }
//           }
//       }
//       return cookieValue;
//   }

//   var csrftoken = getCookie('csrftoken');
//   // console.log(csrftoken);
//   function csrfSafeMethod(method) {
//       // these HTTP methods do not require CSRF protection
//       return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
//   }

//   $.ajaxSetup({
//       beforeSend: function(xhr, settings) {
//           if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
//               xhr.setRequestHeader("X-CSRFToken", csrftoken);
//           }
//       }
//   });

$.ajaxSetup({ 
     beforeSend: function(xhr, settings) {
         function getCookie(name) {
             var cookieValue = null;
             if (document.cookie && document.cookie != '') {
                 var cookies = document.cookie.split(';');
                 for (var i = 0; i < cookies.length; i++) {
                     var cookie = jQuery.trim(cookies[i]);
                     // Does this cookie string begin with the name we want?
                     if (cookie.substring(0, name.length + 1) == (name + '=')) {
                         cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                         break;
                     }
                 }
             }
             return cookieValue;
         }
         if (!(/^http:.*/.test(settings.url) || /^https:.*/.test(settings.url))) {
             // Only send the token to relative URLs i.e. locally.
             xhr.setRequestHeader("X-CSRFToken", getCookie('csrftoken'));
         }
     } 
});

  $('#login_button').on('click', function(){
    console.log("1")
    $.ajax({
      type: 'POST',
      url: '/authenticate/',
      data: {
        "username": $('#login_id').val(),
        "password": $('#password_user').val()
      },
      success: function(data){
        if (data.success == true){

        } else {
        	console.log('Check your username and password m8');
        }
      }
    })
    console.log("passed");

  })
