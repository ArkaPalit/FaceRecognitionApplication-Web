from django.shortcuts import render, redirect, HttpResponse, HttpResponseRedirect
from django.contrib.auth.models import User, auth
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from outside.forms import Outside_Person
import django.utils.timezone
from datetime import datetime
from outside.models import Outside_Person
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
def outside(request):
    if request.method == 'POST':
        full_name = request.POST.get('full_name')
        address = request.POST.get('address')
        purpose = request.POST.get('purpose')
        phone_no = request.POST.get('phone_no')
        time_of_entry = request.POST.get('time_of_entry')
        email = request.POST.get('email')
        date = request.POST.get('date')
        outside = Outside_Person(full_name=full_name, address=address, purpose=purpose, phone_no=phone_no, time_of_entry=time_of_entry, date=date, email=email)
        outside.save()
        messages.success(request, "Person added to the database successfully.")
    out = Outside_Person.objects.all()
    return render(request, 'outside_person/outside_person.html',{'out':out})
    # return HttpResponse("this is outside person page")



@login_required(login_url='/')
def delete_outside(request, id):
    if request.method == 'POST':
        try:
            del_outside = Outside_Person.objects.get(pk=id)
            del_outside.delete()
            return redirect('/outside/')
        except del_outside.DoesNotExist:
            del_outside = None
            return HttpResponseRedirect('/outside/')

@login_required(login_url='/')
def view_outside(request, id):
    if request.method == 'POST':
        try:
            view_out = Outside_Person.objects.get(pk=id)
            return render(request, 'outside_person/outside_person_view.html',{'view_out':view_out})
        except view_out.DoesNotExist:
            view_out = None
            return HttpResponseRedirect('outside/')

@login_required(login_url='/')
def edit_outside(request, id):
    if request.method == 'POST':
        edit_outside = Outside_Person.objects.get(pk=id)
        fm = Outside_Person(request.POST, instance=edit_outside)
        if fm.is_valid():
            fm.save()
    else:
        edit_outside = Outside_Person.objects.get(pk=id)
        fm = Outside_Person(instance=edit_outside) 
    return render(request, 'outside_person/outside_person_edit.html',{'fm':fm})

@login_required(login_url='/')
def scan_outside(request):
    pass