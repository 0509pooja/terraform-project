#!/bin/bash

# Update and install PostgreSQL
sudo apt-get update
sudo apt-get install -y postgresql postgresql-contrib

# Switch to the postgres user and create a new database and user
sudo -i -u postgres psql <<EOF
CREATE DATABASE wp;
CREATE USER poojauser WITH ENCRYPTED PASSWORD 'poojapassword';
GRANT ALL PRIVILEGES ON DATABASE wp TO poojauser;
EOF

# Allow external connections to PostgreSQL
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/12/main/postgresql.conf
echo "host    all             all             0.0.0.0/0               md5" | sudo tee -a /etc/postgresql/12/main/pg_hba.conf

# Restart PostgreSQL to apply changes
sudo systemctl restart postgresql

echo "PostgreSQL setup complete."
