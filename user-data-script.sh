#!/bin/bash

# Update package repositories
apt update -y

# Install Apache web server
apt install apache2 -y

# Get IMDSv2 token
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" \
-H "X-aws-ec2-metadata-token-ttl-seconds: 21600" -s)

# Get EC2 Instance ID
INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
-s http://169.254.169.254/latest/meta-data/instance-id)

# Create webpage
echo "<h1>Instance ID: $INSTANCE_ID</h1>" > /var/www/html/index.html

# Start Apache
systemctl start apache2
systemctl enable apache2
