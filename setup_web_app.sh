#!/bin/bash

# Update and install necessary packages
sudo apt-get update
sudo apt-get install -y nginx python3 python3-pip python3-venv git

# Clone the web application repository
git clone https://github.com/0509pooja/PROJECT.git /var/www/APP

# Set up Python virtual environment
cd /var/www/APP
python3 -m venv venv
source venv/bin/activate

# Install Flask and other required Python packages
pip install flask psycopg2-binary

# Create a simple Flask app
cat <<EOF > /var/www/APP/app.py
from flask import Flask, render_template
import psycopg2

app = Flask(__name__)

# Database connection
def connect_to_database():
    conn = psycopg2.connect(
        dbname="wp",
        user="poojauser",
        password="poojapassword",
        host="postgres_server_private_ip",
        port="5432"
    )
    return conn

@app.route('/')
def index():
