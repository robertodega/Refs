

#   progect creation

mkdir <PROJ_NAME>
cd <PROJ_NAME>
python3 -m venv venv

#   --------------------------------------
#       if it doesn't work:
#           sudo apt-get update
#           sudo apt-get upgrade
#           sudo apt install ppython3 pip
#           sudo apt install python3-venv
#   --------------------------------------

#   project activation

source venv/bin/activate
pip install django
pip install djangorestframework
django-admin startproject <PROJ_NAME> .
django-admin startapp <APP_NAME>
python3 manage.py migrate
python3 manage.py createsuperuser
python3 manage.py runserver

#   project population

mkdir static
mkdir static/css
mkdir static/js
mkdir templates
touch static/css/custom.css
touch static/js/custom.js
touch templates/main.html

#   in /<PROJ_NAME>/urls.py

from django.contrib import admin
from django.urls import path, include
from django.views.generic.base import TemplateView

urlpatterns = [
    path('admin/', admin.site.urls),
    path('accounts/', include('django.contrib.auth.urls')),
    path("", TemplateView.as_view(template_name="main.html"), name="main"),
    path("admin/", TemplateView.as_view(template_name="home.html"), name="admin"),
]


#   in /<PROJ_NAME>/settings.py

...

INSTALLED_APPS = [
    ...
    'rest_framework',
]

...

TEMPLATES = [
    {   
        ...
        'DIRS': [BASE_DIR / "templates"],
        ...

...

STATICFILES_DIRS = [
    BASE_DIR / "static",
]

...

LOGIN_REDIRECT_URL = "main"
LOGOUT_REDIRECT_URL = "main"

    >   edit /templates/main.html

{% load static %}
<!DOCTYPE HTML>
<html>
    <head>
        <title>Page Title</title>
        <link rel="stylesheet" href="{% static 'css/custom.css'%}" />

        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet" />
        
    </head>
    <body>
        Page Content
    </body>
</html>

<script src="{% static 'js/custom.js'%}"></script>


edit static/css/custom.css
edit static/js/custom.js

