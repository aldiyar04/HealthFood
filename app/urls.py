from django.urls import path

from . import views

urlpatterns = [
    path('', views.index,  name='index'),
    path('shop', views.shop, name='shop'),
    path('products/<slug:slug>', views.product, name='product'),
    path('faq', views.faq, name='faq'),
    path('about', views.about, name='about'),
    path('contact', views.contact, name='contact'),
    path('signin', views.signin, name='signin'),
    path('signout', views.signout, name='signout'),
    path('register', views.register, name='register'),
    path('account', views.account, name='account'),
    path('edit_account', views.edit_account, name='edit_account'),
    path('delete_account', views.delete_account, name='delete_account'),
    path('cart', views.cart, name='cart'),
    path('cart_item_count', views.cart_item_count, name='cart_item_count'),
    path('update_cart', views.update_cart, name='update_cart'),
    path('place_order', views.place_order, name='place_order'),
]
