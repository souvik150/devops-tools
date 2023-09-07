#!/bin/bash

# Step 1: Create an SSH key pair and save the private key to a file
aws ec2 create-key-pair --key-name kalisouvik150 --query 'KeyMaterial' --output text > kalisouvik150.pem

# Step 2: Create a security group with a description
aws ec2 create-security-group --group-name souvik-linux-cli --description "This is from my Linux"

# Step 3: Fetch your public IP address using curl
public_ip=$(curl https://checkip.amazonaws.com)

# Step 4: Authorize SSH traffic (port 22) from your current public IP
security_group_id=$(aws ec2 describe-security-groups --group-names souvik-linux-cli --query 'SecurityGroups[0].GroupId' --output text)
aws ec2 authorize-security-group-ingress --group-id $security_group_id --protocol tcp --port 22 --cidr $public_ip/32

# Step 5: Authorize additional ports (22-8000) for flexibility
aws ec2 authorize-security-group-ingress --group-id $security_group_id --protocol tcp --port 22-8000 --cidr $public_ip/32

# Step 6: Launch an EC2 instance
aws ec2 run-instances --image-id ami-06f621d90fa29f6d0 --count 1 --instance-type t2.micro --key-name kalisouvik150 --security-groups souvik-linux-cli

# Step 7: Create a tag for the launched instance
instance_id=$(aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[0].Instances[0].InstanceId" --output text)
aws ec2 create-tags --resources $instance_id --tags Key=souvik,Value=linux

# Return the instance ID
echo "EC2 instance ID: $instance_id"
