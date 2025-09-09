#   Project creation

-  mkdir PROJECTS/Python/APP/<APP_NAMWE>
-  cd PROJECTS/Python/APP/<APP_NAMWE>

#   Virtual Environment usage

- python3 -m venv venv
- source venv/bin/activate
- python3 -m pip install --upgrade pip setuptools
- pip install flask

#   Project files creation

-touch <FILE_NAME>.py
-pip freeze > requirements.txt
-nano <FILE_NAME>.py

    from flask import Flask

    app = Flask(__name__)

    @app.route('/')

    def index():
        return"<h1>Home Page</h1>"

- flask run

#   Templates usage

- mkdir templates
- touch templates/index.html

    def index():
        return render_template('index.html')
