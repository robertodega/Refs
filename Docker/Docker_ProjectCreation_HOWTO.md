
# creazione progetto ( Python )

    mkdir <PATH_TO_APP>/docker_example_app
    cd <PATH_TO_APP>docker_example_app

# utilizzo ambiente virtuale

    python3 -m venv venv
    source venv/bin/activate
    sudo apt install python3-flask

# costruzione files progetto

    touch app.py requirements.txt Dockerfile

# costruzione da terminale dell'immagine docker

    docker build -t docker_example_app .

# esecuzione container

    docker run -p 5000:5000 docker_example_app

# accesso all'applicazione

    http://localhost:5000
