

#   Project creation

    mkdir <PROJ_NAME>
    cd <PROJ_NAME>
    python3 -m venv venv


#   If it doesn't work:

    sudo apt-get update
    sudo apt-get upgrade
    sudo apt install ppython3 pip
    sudo apt install python3-venv

#   Project activation

    source venv/bin/activate
    pip install django
    pip install djangorestframework
    django-admin startproject <PROJ_NAME> .
    django-admin startapp <APP_NAME>
    python3 manage.py migrate
    python3 manage.py createsuperuser
    python3 manage.py runserver

#   Project population

    mkdir static static/css static/js templates
    touch static/css/custom.css static/js/custom.js templates/main.html

#   Project files update

<u>in <strong>/<PROJ_NAME>/urls.py</strong></u>

    from django.contrib import admin
    from django.urls import path, include
    from django.views.generic.base import TemplateView

    urlpatterns = [
        path('admin/', admin.site.urls),
        path('accounts/', include('django.contrib.auth.urls')),
        path("", TemplateView.as_view(template_name="main.html"), name="main"),
        path("admin/", TemplateView.as_view(template_name="home.html"), name="admin"),
    ]

<u>in <strong>/<PROJ_NAME>/settings.py</strong></u>

    ...

    INSTALLED_APPS = [
        ...
        'rest_framework',
        '<APP_NAME>',
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

    LOGIN_REDIRECT_URL = "main"
    LOGOUT_REDIRECT_URL = "main"

<br /><br /><u>edit /templates/main.html </u>

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

- <u>edit static/css/custom.css</u>
- <u>edit static/js/custom.js</u>

- edit /<APP_NAME>/models.py
- edit /<APP_NAME>/views.py



#   Project RUN

- source venv/bin/activate
- python3 manage.py runserver
