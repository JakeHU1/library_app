"""library_app URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from project.apps.books import views as books_views
from project.apps.auth import views as auth_views
from project.apps.book_cart import views as cart_views
from django.contrib.auth import views as django_auth_views
from django.urls import include


urlpatterns = [
    # books
    path('admin/', admin.site.urls),
    path('', books_views.index),
    path('books/search', books_views.books),
    path('books/<int:book_id>', books_views.book_detail),

    # auth --> https://ordinarycoders.com/blog/article/django-user-register-login-logout
    path('login/', auth_views.login),
    path('logout/', auth_views.logout),
    path('register/', auth_views.register),
    path('profile/', auth_views.profile),

    # password_reset --> https://ordinarycoders.com/blog/article/django-password-reset
    path('password_reset', auth_views.password_reset, name='password_reset'),
    path('password_reset/done/', django_auth_views.PasswordResetDoneView.as_view(
        template_name='password_reset_done.html'), name='password_reset_done'),
    path('reset/<uidb64>/<token>/', django_auth_views.PasswordResetConfirmView.as_view(
        template_name='password_reset_confirm.html'), name='password_reset_confirm'),
    path('reset/done/', django_auth_views.PasswordResetCompleteView.as_view(
        template_name='password_reset_complete.html'), name='password_reset_complete'),

    # cart --> https://pypi.org/project/django-shopping-cart/
    path('cart/add/<int:id>/', cart_views.cart_add, name='cart_add'),
    path('cart/item_clear/<int:id>/', cart_views.item_clear, name='item_clear'),
    path('cart/item_increment/<int:id>/',
         cart_views.item_increment, name='item_increment'),
    path('cart/item_decrement/<int:id>/',
         cart_views.item_decrement, name='item_decrement'),
    path('cart/cart_clear/', cart_views.cart_clear, name='cart_clear'),
    path('cart/cart-detail/', cart_views.cart_detail, name='cart_detail'),


]
