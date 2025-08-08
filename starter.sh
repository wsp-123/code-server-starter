#!/bin/bash

# Pull the latest Docker image for code-server
docker pull codercom/code-server:latest

# Run the container in the background on port 8080
docker run -d -p 8080:8080 --name tender_dhawan codercom/code-server:latest

# Wait for the container to initialize (optional, but recommended)
echo "Waiting for code-server to initialize..."
sleep 5

# Retrieve the password directly if available
password_file="/var/lib/docker/overlay2/$(docker inspect --format '{{.GraphDriver.Data.LowerDir}}' tender_dhawan | cut -d/ -f4-)/merged/home/coder/.config/code-server/config.yaml"

# Check if the file exists
if [ -f "$password_file" ]; then
  # Extract the password from config.yaml and show it
  password=$(grep -oP 'password: \K.+' "$password_file")
  
  if [ -n "$password" ]; then
    echo "Code-server is running on http://localhost:8080"
    echo "Your password for code-server is: $password"
  else
    echo "Password not found in config.yaml."
    echo "Please check the config.yaml manually at: $password_file"
  fi
else
  echo "Failed to find the config file. Please check if the container is running correctly."
  echo "You can manually check the password at: $password_file"
fi

# If the password doesn't work, show the fallback command
echo "If the password fails, you can manually retrieve it by running this command:"
echo "cat $password_file"
