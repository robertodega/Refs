# project creation

- mkdir aliases
- cd aliases

# virtual env set

- python3 -m venv venv
- pip install flask mysql-connector-python

-   Linux
    - source venv/bin/activate
    - python3 aliases.py

-   Windows (powershell)
    - .\venv\Scripts\activate
    - python .\aliases.py

# DB creation

[ from MySQL ]

        -- phpMyAdmin SQL Dump
        -- version 5.2.1
        -- https://www.phpmyadmin.net/
        --
        -- Host: 127.0.0.1
        -- Generation Time: Oct 10, 2025 at 11:37 AM
        -- Server version: 10.4.32-MariaDB
        -- PHP Version: 8.2.12

        SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
        START TRANSACTION;
        SET time_zone = "+00:00";


        /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
        /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
        /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
        /*!40101 SET NAMES utf8mb4 */;

        --
        -- Database: `aliases_python`
        --
        CREATE DATABASE IF NOT EXISTS `aliases_python` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
        USE `aliases_python`;

        -- --------------------------------------------------------

        --
        -- Table structure for table `aliases`
        --

        DROP TABLE IF EXISTS `aliases`;
        CREATE TABLE `aliases` (
        `id` int(11) NOT NULL,
        `alias_name` varchar(50) DEFAULT NULL,
        `alias_cmd` varchar(255) DEFAULT NULL
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

        --
        -- Indexes for dumped tables
        --

        --
        -- Indexes for table `aliases`
        --
        ALTER TABLE `aliases`
        ADD PRIMARY KEY (`id`),
        ADD UNIQUE KEY `alias_name` (`alias_name`);

        --
        -- AUTO_INCREMENT for dumped tables
        --

        --
        -- AUTO_INCREMENT for table `aliases`
        --
        ALTER TABLE `aliases`
        MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
        COMMIT;

        /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
        /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
        /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


# project files creation

- mkdir templates static static/js static/css static/img

- touch aliases.py config.py const.py templates/aliases.html static/js/custom.js static/css/custom.css

- nano const.py

        db_config = {
            'host': 'localhost',
            'user': 'root',
            'password': '',
            'database': 'aliases_python'
        }

# aliases app creation

- nano aliases.py

        from flask import Flask, render_template
        import mysql.connector
        from const import db_config

        app = Flask(__name__)

        @app.route('/')
        def index():
            conn = mysql.connector.connect(**db_config)
            cursor = conn.cursor(dictionary=True)
            cursor.execute("SELECT * FROM aliases")
            aliases_list = cursor.fetchall()
            cursor.close()
            conn.close()
            return render_template('aliases.html', aliases_list=aliases_list)

        if __name__ == '__main__':
            app.run(debug=True)

- nano templates/aliases.html

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <title>Aliases</title>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">

            <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

            <link rel="icon" type="image/x-icon" href="{{ url_for('static', filename='img/favicon.ico') }}">
            <link rel="stylesheet" href="{{ url_for('static', filename='css/custom.css') }}">
        </head>

        <body>
            <section id="header">
                <h1>aliases</h1>
            </section>
            {% for alias in aliases_list %}
            <li>alias: {{ alias.alias_name }} => {{ alias.alias_cmd }}</li>
            {% endfor %}
        </body>
        </html>

        <script src="{{ url_for('static', filename='js/custom.js') }}"></script>

# project execution

[ from App root ]

-   Linux
    - source venv/bin/activate
    - python3 aliases.py

-   Windows (powershell)
    - .\venv\Scripts\activate
    - python .\aliases.py
