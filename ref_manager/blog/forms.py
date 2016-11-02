from django.contrib.auth.forms import AuthenticationForm
from django import forms

<<<<<<< HEAD
# If you don't do this you cannot use Bootstrap CSS
=======

>>>>>>> 7a9199082485c847cb915bcedcad93691dccfb87
class LoginForm(AuthenticationForm):
    username = forms.CharField(label="Username", max_length=30,
                               widget=forms.TextInput(attrs={
                                'class': 'form-control',
                                'name': 'username'
<<<<<<< HEAD
                                }))
=======
                               }))
>>>>>>> 7a9199082485c847cb915bcedcad93691dccfb87
    password = forms.CharField(label="Password", max_length=30,
                               widget=forms.TextInput(attrs={
                                'class': 'form-control',
                                'name': 'password'
<<<<<<< HEAD
                               }))
=======
                                }))
>>>>>>> 7a9199082485c847cb915bcedcad93691dccfb87
