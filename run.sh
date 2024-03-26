#!/bin/bash

# Define the Melanin Click download URL
MELANIN_CLICK_URL="https://raw.githubusercontent.com/melaninsolar/melanin_click/main/melanin_click.sh"

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
chmod +x melaninclick.sh

# Run Melanin Click
echo "Starting Melanin Click..."
./melanin_click.sh

# Prompt for user configuration
echo "Please follow the on-screen prompts to configure Melanin Click."