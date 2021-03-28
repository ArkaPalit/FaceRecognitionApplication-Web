from django.contrib import admin
from django.urls import path
from home import views

from django.contrib.auth import views as auth_views
from django.contrib.auth.views import PasswordResetView, PasswordResetDoneView, PasswordResetConfirmView, PasswordResetCompleteView

urlpatterns = [
    # Login, Logout & Signup urls
    path('',views.login, name='login'),
    path('signup/',views.signup, name='signup'),
    path('login/',views.login, name='login'),
    path('logout/',views.logout, name='logout'),

    # Resend OTP
    path('resendOTP', views.resend_otp),

    #Forgot Password urls
    path("password-reset/", 
        auth_views.PasswordResetView.as_view(template_name='login_signup/password_reset.html'),
        name="password_reset"),

    path("password-reset/done/",
        auth_views.PasswordResetDoneView.as_view(template_name='login_signup/password_reset_done.html'),
        name="password_reset_done"),

    path("password-reset-confirm/<uidb64>/<token>/",
        auth_views.PasswordResetConfirmView.as_view(), # template_name='login_signup/password_reset_confirm.html'
        name="password_reset_confirm"),

    path("password-reset-complete/",
    auth_views.PasswordResetCompleteView.as_view(template_name='login_signup/password_reset_complete.html'),
    name="password_reset_complete"),
 

    # home url
    path('home/',views.home,name='home'),
    
    # Other urls
    path('',views.home_face),
    path('scan/options/',views.scan_options ,name='scan_options'),
    path('attendance/options/', views.attendance_options, name='attendance_options'),
    
    
]


