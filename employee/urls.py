from django.contrib import admin
from django.urls import path
from employee import views

urlpatterns = [
    path('employee/',views.employee, name='employee'),
    path('<int:id>/',views.view_employee, name='view_employee'),
    path('delete/<int:id>/',views.delete_employee, name='delete_employee'),   

    path('employee/attendance/',views.employee_attendance, name='employee_attendance'),
    path('delete/<int:id>/',views.delete_employee_attendance, name='delete_employee_attendance'),

    path('scan/employee',views.scan_employee, name='scan_employee'),
]