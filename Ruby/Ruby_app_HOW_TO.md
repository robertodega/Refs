
#   creazione progetto

mkdir PROJECTS/Ruby/test_app
cd PROJECTS/Ruby/test_app

#   installazione gem manager per Ruby

sudo apt update
sudo apt install ruby-full

#   Verifica installazione

ruby -v

#   installazione Sinatra gem

sudo gem install sinatra

#   installazione gemme necessarie

sudo gem install rackup puma

#   run the application

ruby app.rb

http://127.0.0.1:4567
