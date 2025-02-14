
#   ----------------------------------------------------------------

#   configured Python environment

https://www.python.org/downloads/

-   #   creazione progetto

cd <DOWNLOADED_PYTHON_DIR>
mv <DOWNLOADED_PYTHON_DIR> PROJECTS/Python/APP/<APP_NAME>
cd PROJECTS/Python/APP/<APP_NAME>

./configure
make
make test
sudo make install

#   ----------------------------------------------------------------

#   creazione manuale progetto

mkdir PROJECTS/Python/APP/<APP_NAME>
cd PROJECTS/Python/APP/<APP_NAME>

#   ----------------------------------------------------------------

-   #   utilizzo ambiente virtuale

python3 -m venv venv
source venv/bin/activate

-   #   mysql DB management

pip install mysql-connector-python --break-system-packages
pip install pandas

#   ----------------------------------------------------------------

