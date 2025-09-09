# Composer Installation
- Download & install Composer ( https://getcomposer.org/download/ )
        
        php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
        
        php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'.PHP_EOL; } else { echo 'Installer corrupt'.PHP_EOL; unlink('composer-setup.php'); exit(1); }"
        
        php composer-setup.php
        
        php -r "unlink('composer-setup.php');"

- Global install

        sudo mv composer.phar /usr/local/bin/composer

# Project Creation
- composer create-project laravel/laravel <LARAVEL_PROJECT_NAME>
- cd <LARAVEL_PROJECT_NAME>
- mkdir HOWTO
- touch HOWTO/HOWTO.md
- php artisan --version
- in /opt/lampp/htdocs/WWW/PROJECTS/PHP/Laravel/<LARAVEL_PROJECT_NAME>/.env

        DB_CONNECTION=mysql
        DB_HOST=127.0.0.1
        DB_PORT=3306
        DB_DATABASE=<LARAVEL_PROJECT_NAME>
        DB_USERNAME=root
        DB_PASSWORD=

- php artisan migrate

- mkdir public/css public/js
- touch resources/views/home.blade.php public/css/custom.css public/js/custom.js
- nano routes/web.php

        Route::get('/', function () {
            return view('home');
        });

- nano resources/views/home.blade.php

        ... 

        <link rel="stylesheet" href="{{ asset('css/custom.css') }}">

        ... 

        <script src="{{ asset('js/custom.js') }}"></script>

- php artisan serve

# DB table management

- new table creation

        php artisan make:migration create_<TABLE_NAME>_table

- migration update

        nano database/migrations/2025_05_23_131759_create_<TABLE_NAME>_table.php

- migration execution

        php artisan migrate

- table data fill

  - seeder creation

        php artisan make:seeder <TABLE_NAME>TableSeeder
        nano database/seeders/<TABLE_NAME>TableSeeder.php ( insert instructions in function run )

  - seeder registration
        
        nano database/seeders/DatabaseSeeder.php ( insert call to <TABLE_NAME>TableSeeder in function run )

  - seeder execution
  
        php artisan db:seed

                if error:
                - mbstring extension installation

                        sudo apt-get install php-mbstring

                - Apache restart

                        sudo /opt/lampp/lampp restart

                - mbstring extension check

                        php -m | grep mbstring


- table data read

  - model creation
    - php artisan make:model <TABLE_NAME>
    - in '/app/Models/<TABLE_NAME>.php'

                namespace App\Models;

                use Illuminate\Database\Eloquent\Model;

                class <TABLE_NAME> extends Model
                {
                    protected $table = '<TABLE_NAME>';
                    protected $fillable = ['<TABLE_FIELDS>'];
                }


  - controller creation
    - nano app/Http/Controllers/HomeController.php

                namespace App\Http\Controllers;

                use Illuminate\Http\Request;
                use App\Models\<TABLE_NAME>;

                class HomeController extends Controller
                {
                        public function index()
                        {
                                $<TABLE_NAME> = <TABLE_NAME>::all();
                                return view('home', compact('<TABLE_NAME>'));
                        }
                }

  - controller routing
    - nano routes/web.php

                use App\Http\Controllers\HomeController;

                Route::get('/', [HomeController::class, 'index']);

- data show
  - nano resources/views/home.blade.php

                @foreach($<TABLE_NAME> as $item)
                        <tr>
                                <td>{{ $item-><TABLE_FIELD> }}</td>
                                ...
                        </tr>
                @endforeach