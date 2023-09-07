#!/bin/bash

# Check for command line arguments
if [ $# -ne 3 ]; then
  echo "Usage: $0 <template_url> <template_zip> <template_extracted_dir>"
  exit 1
fi

# Assign command line arguments to variables
template_url="$1"
template_zip="$2"
template_extracted_dir="$3"
webfiles_dir="/tmp/webfiles"
web_root="/var/www/html"

# Install required packages
yum install wget unzip httpd -y

# Start and enable Apache HTTP server
sudo systemctl start httpd
sudo systemctl enable httpd

# Create a temporary directory for web files
mkdir -p "$webfiles_dir"
cd "$webfiles_dir"

# Download the template
wget "$template_url"

# Unzip the template
unzip "$template_zip"

# Copy template files to web root
sudo cp -r "$template_extracted_dir"/* "$web_root"

# Restart Apache HTTP server
systemctl restart httpd

# Clean up temporary files
rm -rf "$webfiles_dir"
