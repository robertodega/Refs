

-- ------------------------- SSH key management ---------------------------------------------------

check configurated SSH key presence ( id_rsa.pub file or id_ed25519.pub file present if configurated )

- ls -al ~/.ssh

Key creation

- ssh-keygen -t ed25519 -C "roberto@robertodegaetano.it"

Publi key content read

- cat ~/.ssh/id_ed25519.pub

SSH agent run

- eval "$(ssh-agent -s)"          #   [ Agent pid 19991 ]

SSH key addition to agent

- ssh-add ~/.ssh/id_ed25519
- From GitHub > Settings > SSH and GPG keys ( https://github.com/settings/keys ) => New SSH Key => paste key & save

GitHub connection test

- ssh -T git@github.com

-- ------------------------- Repo creation and management -----------------------------------------

GitHub Repo Creation

- account access > New Repository ( github.com/new ) > Create repository ( without README initialization )
- - [ git@github.com:robertodega/Refs.git ]

Local Repo

- git init
- git checkout -b <BRANCH_NAME> && gitStatus      #   branch for development
- git checkout -b main && gitStatus               #   branch for upload
- git add *
- git commit -m "..."

Local repo connection to Github ( SSH or HTTPS )

- SSH method
  -   git remote add origin git@github.com:<USERNAME>/<REPONAME>  #   [ git remote add origin git@github.com:robertodega/Refs.git ]

- HTTPS method
  -   git remote add origin https://github.com/TUO-USERNAME/NOME-REPO.git

Remot repo addition check

- git remote -v

    - origin  git@github.com:<USERNAME>/<REPONAME> (fetch)
    - origin  git@github.com:<USERNAME>/<REPONAME> (push)

Local repo push to remote

- git branch -M main
- git push -u origin main

#   -------------------------------------------------------------------------------------------------------
