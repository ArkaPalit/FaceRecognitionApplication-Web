from django.db import models

# Create your models here.

class Employee(models.Model):
    employee_id = models.CharField(max_length=20)
    name = models.CharField(max_length=122)
    date_of_birth = models.DateField()
    department = models.CharField(max_length=10)
    school = models.CharField(max_length=6)
    university_mail = models.CharField(max_length=20)
    date_of_joining = models.DateField()
    photo = models.ImageField(upload_to='employee_img/', blank=True)
    id_proof_no = models.CharField(max_length=20)
    id_type = models.CharField(max_length=20)
    id_photo = models.ImageField(upload_to='employee_id/',blank=True)
    def __str__(self):
        return self.name
    
    
    

class Employee_Attendance(models.Model):
    employee_id = models.CharField(max_length=20,)
    department = models.CharField(max_length=100)
    name = models.CharField(max_length=122)
    time_of_entry = models.TimeField(auto_now=True)
    time_of_exit = models.TimeField()
    date = models.DateField(auto_now=True)
    def __str__(self):
        return self.name
    