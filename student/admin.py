from django.contrib import admin

from student.models import Student_Attendance
from student.models import Student

# Register your models here.

admin.site.register(Student)

admin.site.register(Student_Attendance)