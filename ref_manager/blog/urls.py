from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^login/$', views.login_request),
    url(r'^home/$', views.home),
    url(r'^references/$', views.references),
    url(r'^authenticate/$', views.authentication),
]
