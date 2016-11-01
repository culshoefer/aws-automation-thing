from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^login/$', views.login, name='login'),
    url(r'^references/$', views.references_page, name='references'),
    url(r'^signup/$', views.signup, name='signup'),
    url(r'^team/$', views.group, name='group'),
    url(r'^', views.login, name='login')
]
