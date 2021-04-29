"""Main URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    # Home App
    path('',include('home.urls')),
    path('signup/',include('home.urls')),
    path('login/',include('home.urls')),
    path('logout/',include('home.urls')),
    path('signup/',include('home.urls')),
    path('home/',include('home.urls')),
    path('scan/options/',include('home.urls')),
    path('attendance/options/',include('home.urls')),
    
    
    # Student App
    path('', include("student.urls")),
    path('student/',include('student.urls')),
    path('scan/student/',include('student.urls')),
    path('student/attendance/',include('student.urls')),

    # Employee App
    path('', include("employee.urls")),
    path('employee/',include('employee.urls')),
    path('scan/employee/',include('employee.urls')),
    path('employee/attendance/',include('employee.urls')),

    # Outside Person App
    path('',include('outside.urls')),
    path('outside/',include('outside.urls')),
    path('scan/outside/',include('outside.urls')),
    path('outside/capture/', include('outside.urls')),
]
if settings.DEBUG:
    urlpatterns+=static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)