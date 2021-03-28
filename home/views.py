from django.shortcuts import render, redirect, HttpResponse, HttpResponseRedirect
from django.contrib.auth.models import User, auth
from django.contrib.auth.decorators import login_required
from django.contrib import messages
import django.utils.timezone
from datetime import datetime
from django.shortcuts import get_object_or_404
from subprocess import run,PIPE
import sys
import random
from home.models import UserOTP
from django.core.mail import send_mail
from django.conf import settings

#for face scan
import cv2
import numpy as np
import face_recognition
import os
from datetime import datetime

# Create your views here.

# Log In, Log Out & Sign Up
def login(request):
    if request.user.is_authenticated:
        return redirect('/home/')
    if request.method == 'POST':
        get_otp =  request.POST.get('otp')
        if get_otp:
            get_user = request.POST.get('user')
            user = User.objects.get(username=get_user)
            if int(get_otp) == UserOTP.objects.filter(user=user).last().otp:
                user.is_active = True
                user.save()
                mess_two = f"Hello {user.first_name},\nYou have successfully created your account. Your credentials are as follows.\nFirst Name: {user.first_name}\nLast Name: {user.last_name}\nUsername: {user.username} \n\nThanks!\nDeveloper,\nFace Recognition App"
                send_mail(
                    "Welcome to Face Recognition App",
                    mess_two,
                    settings.EMAIL_HOST_USER,
                    [user.email],
                    fail_silently = False
                )
                auth.login(request, user)
                return redirect('/home/')
            else:
                messages.error(request, 'Invalid OTP, Please check your Email and varify')
                return render(request,'login_signup/signup.html', {'otp':True, 'user':user })


        username = request.POST.get('username')
        password = request.POST.get('password')

        user = auth.authenticate(username=username, password=password)

        if user is not None:
            auth.login(request, user)
            return redirect('/home/')
        elif not User.objects.get(username=username).is_active:
            user = User.objects.get(username=username)
            user_otp = int(random.randint(1000, 9999))
            UserOTP.objects.create(user=user, otp=user_otp)
            mess = f"Hello {user.first_name},\nYour OTP is: {user_otp} \n\nThanks!\nDeveloper,\nFace Recognition App"
            send_mail(
                "Varify Your Email-Face Recognition App",
                mess,
                settings.EMAIL_HOST_USER,
                [user.email],
                fail_silently = False
            )
            messages.info(request, 'OTP sent, Check your Email and varify')
            return render(request,'login_signup/login.html', {'otp':True, 'user':user })
        else:
            messages.info(request, 'Invalid Credentials !')
            return redirect('/login/')
    else:
        return render(request,'login_signup/login.html')


def signup(request):
    if request.method == 'POST':
        get_otp =  request.POST.get('otp')
        if get_otp:
            get_user = request.POST.get('user')
            user = User.objects.get(username=get_user)
            if int(get_otp) == UserOTP.objects.filter(user=user).last().otp:
                user.is_active = True
                user.save()
                mess_two = f"Hello {user.first_name},\n\nYou have successfully created your account.\n\nThanks!\nDeveloper,\nFace Recognition App"
                send_mail(
                    "Welcome to Face Recognition App",
                    mess_two,
                    settings.EMAIL_HOST_USER,
                    [user.email],
                    fail_silently = False
                )
                messages.info(request, f'Account created for {user.username}')
                return redirect('/')
            else:
                messages.error(request, 'Invalid OTP, Please check your Email and varify')
                return render(request,'login_signup/signup.html', {'otp':True, 'user':user })

        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        username = request.POST.get('username')
        password1 = request.POST.get('password1')
        password2 = request.POST.get('password2')
        email = request.POST.get('email')
        
        if password1==password2:
            if User.objects.filter(username=username).exists():
                messages.info(request,'Username already exits !')
                return redirect('/signup/')
            elif User.objects.filter(email=email).exists():
                messages.info(request,'Email already exits !')
                return redirect('/signup/')
            else:
                user = User.objects.create_user(username=username, password=password1, email=email, first_name=first_name, last_name=last_name)
                user.is_active = False
                user.save()
                user_otp = int(random.randint(1000, 9999))
                UserOTP.objects.create(user=user, otp=user_otp)
                
                mess = f"Hello {user.first_name},\nYour OTP is: {user_otp} \n\nThanks!\nDeveloper,\nFace Recognition App"
                send_mail(
                    "Varify Your Email-Face Recognition App",
                    mess,
                    settings.EMAIL_HOST_USER,
                    [user.email],
                    fail_silently = False
                )
                messages.info(request, 'OTP sent, Check your Email and varify')
                return render(request,'login_signup/signup.html', {'otp':True, 'user':user })

                # messages.success(request,'User Registration successfully Completed. Please Login.')
        else:
            messages.info(request,'Password not matching !')
            return redirect('/signup/')
        return redirect('/')
    else:
        return render(request,'login_signup/signup.html')

def logout(request):
    auth.logout(request)
    return redirect('/')

# Home Page
@login_required(login_url='/')
def home(request):
    return render(request,'home/home.html')

# Other Pages


@login_required(login_url='/')
def home_face(request):
    return render(request, 'home/home.html')

def resend_otp(request):
    if request.method == "GET":
        get_user = request.GET.get('user')
        if User.objects.filter(username=get_user).exists() and not User.objects.get(username=get_user).is_active:
            user = User.objects.get(username=get_user)
            user_otp = int(random.randint(1000, 9999))
            UserOTP.objects.create(user=user, otp=user_otp)
            mess = f"Hello {user.first_name},\nYour OTP is: {user_otp} \n\nThanks!\nDeveloper,\nFace Recognition App"
            send_mail(
                "Varify Your Email-Face Recognition App",
                mess,
                settings.EMAIL_HOST_USER,
                [user.email],
                fail_silently = False
            )
            return HttpResponse('Sent')
    return HttpResponse('Failed')


# Face code

          
def scan_options(request):
    return render(request, 'home/scan_options.html')

def attendance_options(request):
    return render(request, 'home/attendance_options.html')