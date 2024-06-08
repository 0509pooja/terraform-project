#!/bin/bash

# Update and install necessary packages
sudo apt-get update
sudo apt-get install -y nginx python3 python3-venv python3-pip

# Configure Nginx
sudo tee /etc/nginx/sites-available/app.conf<<EOF
server {
    listen 80;
    server_name your_domain_or_IP;

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOF

sudo ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/
sudo systemctl restart nginx

echo "Bastion host setup complete."
