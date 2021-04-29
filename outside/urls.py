from django.contrib import admin
from django.urls import path
from outside import views

urlpatterns = [
    path('outside/',views.outside, name='outside'),
    path('delete/<int:id>/',views.delete_outside, name='delete_outside'),
    path('<int:id>/',views.view_outside, name='view_outside'),
    path('<int:id>/',views.edit_outside, name='edit_outside'),

    path('scan/outside/',views.scan_outside, name='scan_outside'),
    
]

