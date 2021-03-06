from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class UserOTP(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    time_st = models.TimeField(auto_now=True)
    date_st = models.DateField(auto_now=True)
    otp = models.SmallIntegerField()