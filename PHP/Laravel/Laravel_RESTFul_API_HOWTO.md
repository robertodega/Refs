- Project creation

        composer create-project --prefer-dist laravel/laravel testApi
        cd testApi
        mkdir HOWTO
        touch HOWTO/HOWTO.md

- Database configuration

        in /opt/lampp/htdocs/WWW/PROJECTS/PHP/Laravel/<LARAVEL_PROJECT_NAME>/.env

            DB_CONNECTION=mysql
            DB_HOST=127.0.0.1
            DB_PORT=3306
            DB_DATABASE=apimanager
            DB_USERNAME=root
            DB_PASSWORD=

- Resource creation ( Model, Migration, Controller )

    - php artisan make:model Test -mc

        [ or single instrucion for Model and Controller ]

        - php artisan make:model Post -m
        - php artisan make:controller Api/PostController --api

    - update testApi/app/Models/Test.php

            <?php

            namespace App\Models;

            use Illuminate\Database\Eloquent\Factories\HasFactory;
            use Illuminate\Database\Eloquent\Model;

            class Test extends Model
            {
                use HasFactory;

                protected $fillable = [
                    'titolo',
                    'descrizione',
                ];
            }

    - update testApi/database/migrations/2025_06_17_084040_create_tests_table.php

            public function up(): void
            {
                Schema::create('tests', function (Blueprint $table) {
                    $table->id();
                    $table->string('titolo');
                    $table->text('descrizione')->nullable();
                    $table->timestamps();
                });
            }

- RESTful API controller implementation


    -   update testApi/app/Http/Controllers/TestController.php

            <?php

            namespace App\Http\Controllers;

            use App\Models\Test;
            use Illuminate\Http\Request;

            class TestController extends Controller
            {
                public function index()
                {
                    return Test::all();
                }

                public function store(Request $request)
                {
                    $data = $request->validate([
                        'titolo' => 'required|string|max:255',
                        'descrizione' => 'nullable|string',
                    ]);
                    return Test::create($data);
                }

                public function show(Test $test)
                {
                    return $test;
                }

                public function update(Request $request, Test $test)
                {
                    $data = $request->validate([
                        'titolo' => 'required|string|max:255',
                        'descrizione' => 'nullable|string',
                    ]);
                    $test->update($data);
                    return $test;
                }

                public function destroy(Test $test)
                {
                    $test->delete();
                    return response()->json(['message' => 'Deleted successfully']);
                }
            }

- Routed definition

    -   open routes/api.php
    -   insert

            <?php

            use Illuminate\Http\Request;
            use Illuminate\Support\Facades\Route;
            use App\Http\Controllers\TestController;

            Route::apiResource('tests', TestController::class);

- php artisan migrate

- php artisan serve

- API test

    API can be now tested with Postman with the following routes:

        GET http://127.0.0.1:8000/api/tests
        POST http://localhost:8000/api/tests
        GET http://localhost:8000/api/tests/{id}
        PUT/PATCH http://localhost:8000/api/tests/{id}
        DELETE http://localhost:8000/api/tests/{id}
