from django.conf.urls import url

from . import views

urlpatterns = [
<<<<<<< HEAD

    url(r'^login/$', views.login_request, name='login'),
    url(r'^home/$', views.home, name='references'),
    url(r'^references/$', views.references),
    url(r'^signup/$', views.signup, name='signup'),
    url(r'^team/$', views.group, name='group'),
    url(r'^authenticate/$', views.authentication),
=======
    url(r'^login$', views.login_request, name='login'),
    url(r'^home$', views.home, name='references'),
    url(r'^references$', views.references),
    url(r'^signup$', views.signup, name='signup'),
    url(r'^team$', views.group, name='group'),
    url(r'^authenticate$', views.authentication),
    url(r'^register_user$', views.register_user, name='register'),
>>>>>>> 7a9199082485c847cb915bcedcad93691dccfb87
    url(r'^', views.login_request, name='login'),
]

