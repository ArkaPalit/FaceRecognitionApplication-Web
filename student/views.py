from django.shortcuts import render, redirect, HttpResponse, HttpResponseRedirect
from django.contrib.auth.models import User, auth
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from home.urls import path
import django.utils.timezone
from datetime import datetime
from student.models import Student

from student.models import Student_Attendance
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
def student(request):
    # return HttpResponse("this is student page")
    if request.method == 'POST':
        reg_no = request.POST.get('reg_no')
        name = request.POST.get('name')
        course = request.POST.get('course')
        course_years = request.POST.get('course_years')
        school = request.POST.get('school')
        dept = request.POST.get('dept')
        roll_no = request.POST.get('roll_no')
        university_mail = request.POST.get('university_mail')
        mentors_name = request.POST.get('mentors_name')
        date_of_admission = request.POST.get('date_of_admission')
        photo = request.FILES.get('photo')
        parents_name = request.POST.get('parents_name')
        parents_no = request.POST.get('parents_no')
        parents_email = request.POST.get('parents_email')
        date_of_birth = request.POST.get('date_of_birth')
        id_proof_no = request.POST.get('id_proof_no')
        id_type = request.POST.get('id_type')
        id_photo = request.FILES.get('id_photo')
        student=Student(reg_no=reg_no, name=name, course=course, course_years=course_years, school=school, dept=dept, roll_no=roll_no, university_mail=university_mail, mentors_name=mentors_name, date_of_admission=date_of_admission, photo=photo, parents_name=parents_name, parents_no=parents_no, parents_email=parents_email, date_of_birth=date_of_birth, id_proof_no=id_proof_no, id_type=id_type, id_photo=id_photo)
        student.save()
        messages.success(request, "Student added to the database.")
    stu = Student.objects.all()
    return render(request, 'student/student.html',{'stu':stu})

@login_required(login_url='/')
def view_student(request, id):
    if request.method == 'POST':
        try:
            view_stu = Student.objects.get(pk=id)
            return render(request, 'student/student_view.html',{'view_stu':view_stu})
        except view_stu.DoesNotExist:
            view_stu = None
            return HttpResponseRedirect('student/')
    else:
        return redirect('student/')

@login_required(login_url='/')
def delete_student(request, id):
    if request.method == 'POST':
        del_student = Student.objects.get(pk=id)
        del_student.delete()
        return redirect('/student/')



@login_required(login_url='/')
def student_attendance(request):
    # return HttpResponse("this is entry & exit page")
    if request.method == 'POST':
         roll_no = request.POST.get('roll_no')
         reg_no = request.POST.get('reg_no')
         name = request.POST.get('name')
         time_of_entry = request.POST.get('time_of_entry')
         time_of_exit = request.POST.get('time_of_exit')
         student_attendance=Student_Attendance(roll_no=roll_no, reg_no=reg_no, name=name, time_of_entry=time_of_entry, time_of_exit=time_of_exit)
         student_attendance.save()
         messages.success(request, "Details added to the database !")
    stu_att = Student_Attendance.objects.all()
    return render(request, 'student/student_attendance.html',{'stu_att':stu_att})

@login_required(login_url='/')
def delete_student_attendance(request, id):
    if request.method == 'POST':
        del_student_attendance = Student_Attendance.objects.get(pk=id)
        del_student_attendance.delete()
        return redirect('/student/attendance/')


@login_required(login_url='/')
def scan_student(request):
    path='media/student_img'
    images=[]
    classNames=[]
    myList=os.listdir(path)
    print(myList)
    for cl in myList:
        curImg=cv2.imread(f'{path}/{cl}')
        images.append(curImg)
        classNames.append(os.path.splitext(cl)[0])
    print(classNames)

    def markAttendance(name):
        with open('static/Attendance.csv','r+') as f:
            myDataList=f.readlines()
            nameList=[]
            for line in myDataList:
                entry=line.split(', ')
                nameList.append(entry[0])
            if name not in nameList:
                now=datetime.now()
                dtString=now.strftime('%H:%M %S')
                f.writelines(f'\n{name},{dtString}')
    markAttendance('Scanning Started')

    def findEncodings(images):
        encodeList=[]
        for img in images:
            img=cv2.cvtColor(img,cv2.COLOR_BGR2RGB)
            encode=face_recognition.face_encodings(img)[0]
            encodeList.append(encode)
        return encodeList
    encodeListKnown=findEncodings(images)
    print('Loading Complete')

    cap=cv2.VideoCapture(0)

    while True:
        success,img=cap.read()
        imgS=cv2.resize(img,(0,0),None,0.25,0.25)
        imgS=cv2.cvtColor(imgS,cv2.COLOR_BGR2RGB)
        
        facesCurFrame=face_recognition.face_locations(imgS)
        encodesCurFrame=face_recognition.face_encodings(imgS,facesCurFrame)

        for encodeFace,faceLoc in zip(encodesCurFrame,facesCurFrame):
            matches=face_recognition.compare_faces(encodeListKnown,encodeFace)
            faceDis=face_recognition.face_distance(encodeListKnown,encodeFace)
            # print(faceDis)
            matchIndex=np.argmin(faceDis)

            if matches[matchIndex]:
                name=classNames[matchIndex].upper()
                print(name)
                y1,x2,y2,x1=faceLoc
                y1,x2,y2,x1=y1*4,x2*4,y2*4,x1*4
                cv2.rectangle(img,(x1,y1),(x2,y2),(0,255,0),2)
                cv2.rectangle(img,(x1,y2-35),(x2,y2),(0,255,0),cv2.FILLED)
                cv2.putText(img,name,(x1+6,y2-6),cv2.FONT_HERSHEY_COMPLEX,1,(255,255,255),2)
                markAttendance(name)
        
        cv2.imshow('Scanning Faces',img)
        if cv2.waitKey(1)==13:
            break