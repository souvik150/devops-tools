#!/bin/bash

# Variables
webfiles_dir="/tmp/webfiles"
template_url="https://www.tooplate.com/zip-templates/2136_kool_form_pack.zip"
template_zip="2136_kool_form_pack.zip"
template_extracted_dir="2136_kool_form_pack"
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

# You can make variables permanent by exporting from .bashrc file

