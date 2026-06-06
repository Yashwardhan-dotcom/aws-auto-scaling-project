#!/bin/bash

# Update package repositories
apt update -y

# Install Apache web server
apt install apache2 -y

# Fetch EC2 Instance ID from AWS Metadata Service
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# Create a simple webpage displaying the instance ID
echo "<h1>Instance ID: $INSTANCE_ID</h1>" > /var/www/html/index.html

# Start Apache service
systemctl start apache2

# Ensure Apache starts automatically on reboot
systemctl enable apache2
