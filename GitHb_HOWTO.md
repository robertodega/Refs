

#   -------------------------------------------------------------------------------------------------------

#   Chiave SSH

Verifica della presenza della chiave SSH configurata ( se presete file id_rsa.pub o id_ed25519.pub, la chiave SSH è presente )

    -   ls -al ~/.ssh

Creazione chiave 

    -   ssh-keygen -t ed25519 -C "roberto@robertodegaetano.it"

Contenuto Chiave Pubblica

    -   cat ~/.ssh/id_ed25519.pub

Avviamento agente SSH

    -   eval "$(ssh-agent -s)"          #   [ Agent pid 19991 ]

Aggiunta chiave SSH all'agente

    -   ssh-add ~/.ssh/id_ed25519
    -   Su GitHub → Impostazioni → SSH and GPG keys ( https://github.com/settings/keys ) => New SSH Key => incolla la chiave e salvala

Test connessione GitHub

    -   ssh -T git@github.com

#   -------------------------------------------------------------------------------------------------------

#   Creazione e utilizzo REPO 

Creazione repository su GitHub

accesso all'account ->  New Repository ( github.com/new )   -> Create repository ( senza inizializzare con un README )  
#   [ git@github.com:robertodega/Refs.git ]

Repository Locale

    -   git init
    -   git checkout -b <BRANCH_NAME> && gitStatus      #   branch for development
    -   git checkout -b main && gitStatus               #   branch for upload
    -   git add *
    -   git commit -m "..."

Collegamento repository locale a GitHub

    -   metodo SSH
        -   git remote add origin git@github.com:<USERNAME>/<REPONAME>  #   [ git remote add origin git@github.com:robertodega/Refs.git ]

    -   alternativa: HTTPS
        -   git remote add origin https://github.com/TUO-USERNAME/NOME-REPO.git

Verifica corretta aggiunta remoto

    -   git remote -v

            origin  git@github.com:<USERNAME>/<REPONAME> (fetch)
            origin  git@github.com:<USERNAME>/<REPONAME> (push)

Push di locale su remoto

    -   git branch -M main
    -   git push -u origin main

#   -------------------------------------------------------------------------------------------------------
