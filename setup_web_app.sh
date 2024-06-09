#!/bin/bash

# Create a virtual environment and activate it
python3 -m venv env
source env/bin/activate

# Install Flask
pip install flask

# Create the Flask app file
cat << EOF > app.py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return '<h1>Hello, World!</h1>'

if __name__ == '__main__':
    app.run(debug=True)
EOF

# Install psycopg2 for PostgreSQL connection
pip install psycopg2-binary

# Set up environment variables for PostgreSQL connection
export DB_USERNAME="sammy"
export DB_PASSWORD="password"
export DB_NAME="flask_db"
export DB_HOST="localhost"
