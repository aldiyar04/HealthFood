from django.urls import path

from . import views

urlpatterns = [
    path('', views.index,  name='index'),
    path('shop', views.shop, name='shop'),
    path('faq', views.faq, name='faq'),
    path('about', views.about, name='about'),
    path('contact', views.contact, name='contact'),
    path('signin', views.signin, name='signin'),
    path('register', views.register, name='register'),
]
