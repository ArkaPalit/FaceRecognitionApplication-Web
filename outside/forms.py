from django.core import validators
from django import forms
from outside.models import Outside_Person


class EditOutside(forms.ModelForm):
    class Meta:
        fields = ['full_name', 'address', 'purpose', 'phone_no', 'time_of_entry', 'time_of_exit', 'date']
        widgets = {
            'full_name': forms.TextInput(attrs={'class':'form_control'}),
            'address': forms.TextInput(attrs={'class':'form_control'}),
            'purpose': forms.TextInput(attrs={'class':'form_control'}),
            'phone_no': forms.TextInput(attrs={'class':'form_control'}),
            'time_of_entry': forms.TextInput(attrs={'class':'form_control'}),
            'time_of_exit': forms.TextInput(attrs={'class':'form_control'}),
            'date': forms.TextInput(attrs={'class':'form_control'}),
        }