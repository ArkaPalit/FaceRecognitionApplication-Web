from django.db import models

# Create your models here.
class Student(models.Model):
    reg_no = models.CharField(max_length=20)
    name = models.CharField(max_length=122)
    course = models.CharField(max_length=10)
    # course_years = models.IntegerField()
    school = models.CharField(max_length=6)
    dept = models.CharField(max_length=5)
    roll_no = models.CharField(max_length=20) 
    university_mail = models.EmailField(max_length=254)
    mentors_name = models.CharField(max_length=122)
    # date_of_admission = models.DateField()
    photo = models.ImageField(upload_to='student_img/', blank=True)
    parents_name = models.CharField(max_length=122,)
    parents_no = models.IntegerField(default='0')
    parents_email = models.CharField(max_length=20,)
    # date_of_birth = models.DateField()
    # id_proof_no = models.CharField(max_length=20,)
    # id_type = models.CharField(max_length=20,)
    # id_photo = models.ImageField(upload_to='student_id/',blank=True)

    def __str__(self):
        return self.name
    


    

class Student_Attendance(models.Model):
    roll_no = models.CharField(max_length=20)
    reg_no = models.CharField(max_length=20)
    name = models.CharField(max_length=122)
    time_of_entry = models.TimeField(auto_now=True)
    time_of_exit = models.TimeField()
    date = models.DateField(auto_now=True)
    def __str__(self):
        return self.name
    