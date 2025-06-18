- cd /opt/lampp/htdocs/WWW/PROJECTS/PHP/Smarty
- mkdir pageGenerator
- cd pageGenerator

- mkdir templates templates_c cache output output/css output/js output/img customPlugins
- chmod 777 templates_c cache output output/css output/js output/img customPlugins
- touch generator.php templates/page.tpl output/css/custom.css output/js/custom.js

- cp -r ../smarty-4.5.5/libs/ .

- nano templates/page.tpl

        <!DOCTYPE html>
        <html lang="it">
        <head>
            <title>{$titolo}</title>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">

            <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

            <link rel="icon" type="image/x-icon" href="img/favicon.ico" />
            <link rel="stylesheet" href="css/custom.css">
        </head>
        <body>
            <div class='menuDiv'>{$menu}</div>
            <div class='clearDiv'></div>
            <h1>{$titolo}</h1>
            <div>{$contenuto}</div>
        </body>
        </html>

        <script src="js/custom.js"></script>

- nano generator.php

        <?php
        ini_set('display_errors', 1);
        ini_set('display_startup_errors', 1);
        error_reporting(E_ALL);

        require_once __DIR__ . '/libs/Smarty.class.php';

        $smarty = new Smarty();
        $smarty->setTemplateDir(__DIR__ . '/templates/');
        $smarty->setCompileDir(__DIR__ . '/templates_c/');
        $smarty->setCacheDir(__DIR__ . '/cache/');

        $pagine = [
            [
                'slug' => 'index',
                'titolo' => 'Home Page',
                'contenuto' => 'Benvenuto nella pagina principale!'
            ],
            [
                'slug' => 'chi-siamo',
                'titolo' => 'Chi Siamo',
                'contenuto' => 'Siamo un team di sviluppatori appassionati.'
            ],
            [
                'slug' => 'servizi',
                'titolo' => 'I nostri servizi',
                'contenuto' => 'Offriamo sviluppo web, consulenza e formazione.'
            ],
            [
                'slug' => 'portfolio',
                'titolo' => 'Portfolio',
                'contenuto' => 'Guarda alcuni dei nostri progetti realizzati.'
            ],
            [
                'slug' => 'contatti',
                'titolo' => 'Contattaci',
                'contenuto' => 'Scrivici per un preventivo gratuito!'
            ],
        ];

        $outputDir = __DIR__ . '/output/';
        if (!is_dir($outputDir)) {
            mkdir($outputDir, 0777, true);
        }
        $menuList = '';
        foreach ($pagine as $pagina) {
            $menuList .= "<div class='menulink' id='".$pagina['titolo']."' ref='".$pagina['slug']."'>".$pagina['titolo']."</div>"; 
        }
        foreach ($pagine as $pagina) {
            $smarty->assign('titolo', $pagina['titolo']);
            $smarty->assign('menu', $menuList);
            $smarty->assign('contenuto', $pagina['contenuto']);
            $html = $smarty->fetch('page.tpl');
            file_put_contents($outputDir . $pagina['slug'] . '.html', $html);
            echo "Generata: " . $pagina['slug'] . ".html\n";
        }

- nano output/css/custom.css

        .clearDiv{clear: both;}
        .menuDiv{border-bottom: 1px solid grey;}
        .menulink{float: left;border: 1px solid red;text-align: center;cursor: pointer;}
        .menulink{color: orange;}
        .menulink:hover{color: orangered;}

- nano output/js/custom.js

        $('.menulink').width($(window).width() * 0.1);
        $('.menulink').each(function() {
            $(this).on('click', function(){
                document.location.href = ''+$(this).attr('ref')+'.html';
            });
        });

- sudo /opt/lampp/lampp start

- php generator.php

- output/ folder will contain:

        index.html
        chi-siamo.html
        servizi.html
        portfolio.html
        contatti.html




