

download && install composer:

                php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
                php -r "if (hash_file('sha384', 'composer-setup.php') ==='55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
                php composer-setup.php
                php -r "unlink('composer-setup.php');"

put the composer.phar into a directory to simply call composer from any directory (Global install)

        -       sudo mv composer.phar /usr/local/bin/composer

Project Creation

        -   composer create-project laravel/laravel <LARAVEL_PROJECT_NAME>
        -   cd <LARAVEL_PROJECT_NAME>
        -   in /opt/lampp/htdocs/WWW/PROJECTS/PHP/Laravel/<LARAVEL_PROJECT_NAME>/.env

                DB_CONNECTION=mysql
                DB_HOST=127.0.0.1
                DB_PORT=3306
                DB_DATABASE=LARAVEL_DB_NAME
                DB_USERNAME=root
                DB_PASSWORD=

        -   php artisan migrate

                WARN  The database 'bianchifalegnameria_Laravel' does not exist on the 'mysql' connection.  

                ┌ Would you like to create it? ────────────────────────────────┐
                │ Yes                                                          │
                └──────────────────────────────────────────────────────────────┘

                INFO  Preparing database.  

                Creating migration table ............................................................................................................. 7.27ms DONE

                INFO  Running migrations.  

                0001_01_01_000000_create_users_table ................................................................................................ 24.42ms DONE
                0001_01_01_000001_create_cache_table ................................................................................................. 6.61ms DONE
                0001_01_01_000002_create_jobs_table ................................................................................................. 19.34ms DONE

        -   creazione di <LARAVEL_PEOJECT_NAME>/resources/views/home.blade.php
        -   link del blade in <LARAVEL_PEOJECT_NAME>/routes/web.php

                Route::get('/', function () {
                return view('home');
                });

        -   creazione <LARAVEL_PEOJECT_NAME>/public/css/custom.css e link in blade

                <link rel="stylesheet" href="{{ asset('css/custom.css') }}">

        -   creazione <LARAVEL_PEOJECT_NAME>/public/js/custom.js e link in blade

                <script src="{{ asset('js/custom.js') }}"></script>





    