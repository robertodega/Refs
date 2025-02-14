
#   ----------------------------------------------------------------

#   Configured Python environment

https://www.python.org/downloads/

-   #   Project creation

    - cd <DOWNLOADED_PYTHON_DIR>
    - mv <DOWNLOADED_PYTHON_DIR> PROJECTS/Python/APP/<APP_NAME>
    - cd PROJECTS/Python/APP/<APP_NAME>

- ./configure
- make
- make test
- sudo make install

#   ----------------------------------------------------------------

#   Manual project creation

- mkdir PROJECTS/Python/APP/<APP_NAME>
- cd PROJECTS/Python/APP/<APP_NAME>

#   ----------------------------------------------------------------

#   Virtual Environment usage

- python3 -m venv venv
- source venv/bin/activate

#   MySQL DB management

- spip install mysql-connector-python --break-system-packages
- spip install pandas

#   ----------------------------------------------------------------

