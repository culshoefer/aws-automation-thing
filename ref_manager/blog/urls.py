from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^login/$', views.login),
    url(r'^home/$', views.home),
    url(r'^references/$', views.references),
]