
-- ------------------------- project creation -----------------------------------------------------

- mkdir flaskMysqlApp/
- cd flaskMysqlApp/

-- ------------------------- virtual env preparation ----------------------------------------------

- python3 -m venv venv
- source venv/bin/activate
- pip install flask mysql-connector-python

-- ------------------------- DB creation ----------------------------------------------------------

- CREATE DATABASE flaskMysqlApp; [ from MySQL ]

-- ------------------------- project files creation -----------------------------------------------

- mkdir templates
- touch app.py config.py templates/index.html
- nano config.py

- -----------------------------------------------------------
    import mysql.connector

    import mysql.connector

    def get_db_connection():
        return mysql.connector.connect(
            host='localhost',
            user='root',
            password='',
            database='flaskMysqlApp'
        )
- -----------------------------------------------------------

-- ------------------------- Flask app creation ---------------------------------------------------

- nano app.py

- -----------------------------------------------------------
    from flask import Flask, render_template, request
    from config import get_db_connection

    app = Flask(__name__)

    @app.route('/')
    def home():
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM users')
        users = cursor.fetchall()
        cursor.close()
        conn.close()
        return render_template('index.html', users=users)

    @app.route('/add_user', methods=['POST'])
    def add_user():
        username = request.form['username']
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute('INSERT INTO users (username) VALUES (%s)', (username,))
        conn.commit()
        cursor.close()
        conn.close()
        return 'User added successfully'

    if __name__ == '__main__':
        app.run(debug=True)
- -----------------------------------------------------------

- nano templates/index.html

- -----------------------------------------------------------
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Flask App</title>
    </head>
    <body>
        <h1>Welcome to My Flask App!</h1>
        <form action="/add_user" method="post">
            <input type="text" name="username" placeholder="Enter username" required>
            <button type="submit">Add User</button>
        </form>
        <h2>Users List:</h2>
        <ul>
            {% for user in users %}
                <li>{{ user[1] }}</li>
            {% endfor %}
        </ul>
    </body>
    </html>
- -----------------------------------------------------------

-- ------------------------- DB configuration -----------------------------------------------------

- -----------------------------------------------------------
    CREATE TABLE users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(50) NOT NULL
    );
- -----------------------------------------------------------





-- ------------------------- project execution ----------------------------------------------------

- source venv/bin/activate
- python3 app.py [ from App root ]