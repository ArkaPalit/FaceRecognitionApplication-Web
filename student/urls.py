from django.contrib import admin
from django.urls import path
from student import views
from django.urls import include 


urlpatterns = [
    
    path('student/', views.student, name='student'),
    path('<int:id>/',views.view_student, name='view_student'),
    path('delelte/<int:id>/',views.delete_student, name='delete_student'),
    
    path('student/attendance/', views.student_attendance, name='student_attendance'),
    path('delete/<int:id>/', views.delete_student_attendance, name='delete_student_attendance'),

    path('scan/student/',views.scan_student, name='scan_student'),
]

