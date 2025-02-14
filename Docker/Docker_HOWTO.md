
# installazione Docker su Linux (Debian12)

# aggiornamento sistema
- sudo apt-get update
- sudo apt-get upgrade

# installazione pacchetti necessari
- sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# aggiunta chiave GPG ufficiale di Docker
- sudo mkdir -p /etc/apt/keyrings
- curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# impostazione Docker Repository
- echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# installazione Docker Engine
- sudo apt-get update
- sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# verifica isntallazione
- sudo docker run hello-world

# Gestire Docker come utente non root
- sudo usermod -aG docker $USER
- Uscita e rientro account utente per applicazione modifiche

# Verifica
- docker run hello-world


