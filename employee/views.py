from django.shortcuts import render, redirect, HttpResponse, HttpResponseRedirect
from django.contrib.auth.models import User, auth
from django.contrib.auth.decorators import login_required
from django.contrib import messages
import django.utils.timezone
from datetime import datetime
from employee.models import Employee

from employee.models import Employee_Attendance
from django.shortcuts import get_object_or_404
from subprocess import run,PIPE
import sys

#for face scan
import cv2
import numpy as np
import face_recognition
import os
from datetime import datetime
# Create your views here.

@login_required(login_url='/')
def employee(request):
    # return HttpResponse("this is employee page")
    if request.method == 'POST':
        employee_id = request.POST.get('employee_id')
        name = request.POST.get('name')
        date_of_birth = request.POST.get('date_of_birth')
        department = request.POST.get('department')
        school = request.POST.get('school')
        university_mail = request.POST.get('university_mail')
        date_of_joining = request.POST.get('date_of_joining')
        photo = request.FILES.get('photo')
        id_proof_no = request.POST.get('id_proof_no')
        id_type = request.POST.get('id_type')
        id_photo = request.POST.get('id_photo')
        employee=Employee(employee_id=employee_id, name=name, date_of_birth=date_of_birth, department=department, school=school, university_mail=university_mail, date_of_joining=date_of_joining, photo=photo, id_proof_no=id_proof_no, id_type=id_type, id_photo=id_photo)
        employee.save()
        messages.success(request, "Employee added to the database.")
    em = Employee.objects.all()
    return render(request, 'employee/employee.html',{'em':em})

@login_required(login_url='/')
def view_employee(request, id):
    if request.method == 'POST':
        try:
            view_em = Employee.objects.get(pk=id)
            return render(request, 'employee/employee_view.html',{'view_em':view_em})
        except view_em.DoesNotExist:
            view_em = None
            return HttpResponseRedirect('employee/')


@login_required(login_url='/')
def delete_employee(request, id):
    if request.method == 'POST':
        del_employee = Employee.objects.get(pk=id)
        del_employee.delete()
        return redirect('/employee/')



@login_required(login_url='/')
def employee_attendance(request):
    # return HttpResponse("this is employee attendance page")
    if request.method == 'POST':
         employee_id = request.POST.get('employee_id')
         name = request.POST.get('name')
         department = request.POST.get('department')
         time_of_entry = request.POST.get('time_of_entry')
         time_of_exit = request.POST.get('time_of_exit')
         employee_attendance=Employee_Attendance(employee_id=employee_id, department=department, name=name, time_of_entry=time_of_entry, time_of_exit=time_of_exit)
         employee_attendance.save()
         messages.success(request, "Details added to the database !")
    em_att = Employee_Attendance.objects.all()
    return render(request, 'employee/employee_attendance.html',{'em_att':em_att})

@login_required(login_url='/')
def delete_employee_attendance(request, id):
    if request.method == 'POST':
        del_employee_attendance = Employee_Attendance.objects.get(pk=id)
        del_employee_attendance.delete()
        return redirect('/employee/attendance/')

@login_required(login_url='/')
def scan_employee(request):
    pass
