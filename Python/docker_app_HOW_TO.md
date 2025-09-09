
#   Project creation

- mkdir PROJECTS/Python/APP/docker_example_app
- cd PROJECTS/Python/APP/docker_example_app

#   Virtual Environment usage

- python3 -m venv venv
- source venv/bin/activate
- sudo apt install python3-flask

#   Project files creation

- touch app.py
- touch requirements.txt
- touch Dockerfile

#   Docker Image creation

- docker build -t docker_example_app .

#   Container execution

- docker run -p 5000:5000 docker_example_app

#   App Run

- http://localhost:5000
