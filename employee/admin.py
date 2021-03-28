from django.contrib import admin
from employee.models import Employee

from employee.models import Employee_Attendance
# Register your models here.
admin.site.register(Employee)

admin.site.register(Employee_Attendance)