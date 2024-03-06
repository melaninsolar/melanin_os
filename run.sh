#!/bin/bash

# Define the Melanin Click download URL
MELANIN_CLICK_URL="https://github.com/melaninsolar/melaninclick/releases/download/v0.0.3-alpha/melanin-click-v0.0.3-alpha-linux.exe"

# Download Melanin Click
echo "Downloading Melanin Click..."
wget $MELANIN_CLICK_URL

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "Download completed successfully."
else
    echo "Failed to download Melanin Click. Please check the URL and try again."
    exit 1
fi

# Make Melanin Click executable
echo "Making Melanin Click executable..."
chmod +x melanin-click-v0.0.3-alpha-linux.exe

# Run Melanin Click
echo "Starting Melanin Click..."
./melanin-click-v0.0.3-alpha-linux.exe

# Prompt for user configuration
echo "Please follow the on-screen prompts to configure Melanin Click."