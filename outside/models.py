from django.db import models

# Create your models here.

class Outside_Person(models.Model):
        full_name = models.CharField(max_length=50)
        address = models.CharField(max_length=150)
        purpose = models.CharField(max_length=150)
        phone_no = models.IntegerField(default='0')
        email = models.EmailField(max_length=50, default='None', blank=True)
        time_of_entry = models.TimeField(auto_now=True)
        time_of_exit = models.TimeField(null=True, blank=True)
        date = models.DateField(auto_now=True)
        photo = models.ImageField(upload_to='outside_img/')
        def __str__(self):
            return self.full_name
        
