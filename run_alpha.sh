#!/bin/bash

# ========================================================================
# run_alpha.sh
# This script downloads and executes melanin_click_alpha.sh, then starts 
# the Whive miner with periodic rest intervals to prevent overheating.
# ========================================================================

set -e

# Define the Melanin Click download URL
MELANIN_CLICK_URL="https://raw.githubusercontent.com/melaninsolar/melanin_click/alpha/melanin_click_alpha.sh"

# Define the rest interval and duration
MINING_INTERVAL=3600  # Mining for 1 hour
REST_DURATION=600     # Resting for 10 minutes

# Function to log messages
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') : $1"
}

# Welcome message
log "Welcome to the Melanin Click setup script!"

# Disclaimer
echo "DISCLAIMER: This script will install software on your system. Ensure you have sufficient permissions and have backed up your important data. Proceeding indicates acceptance of any risks involved."
read -p "Do you agree to continue with the installation? (y/n) " answer
if [[ "$answer" != "y" ]]; then
    log "Installation canceled."
    exit 1
fi

# Download Melanin Click
log "Downloading Melanin Click..."
wget $MELANIN_CLICK_URL

# Check if the download was successful
if [ $? -eq 0 ]; then
    log "Download completed successfully."
else
    log "Failed to download Melanin Click. Please check the URL and try again."
    exit 1
fi

# Make Melanin Click executable
log "Making Melanin Click executable..."
chmod +x melanin_click_alpha.sh

# Run Melanin Click
log "Starting Melanin Click..."
./melanin_click_alpha.sh

# Prompt for user configuration
log "Please follow the on-screen prompts to configure Melanin Click."

# Mining loop
while true; do
    log "Starting Whive miner..."
    ./whive-cpuminer-mc-yespower/minerd -a yespower -o stratum+tcp://206.189.2.17:3333 -u $NEWADDRESS -p c=WHIVE -t $(nproc)

    log "Mining for $MINING_INTERVAL seconds..."
    sleep $MINING_INTERVAL

    log "Stopping miner for rest period of $REST_DURATION seconds..."
    pkill -f minerd

    log "Resting..."
    sleep $REST_DURATION

    log "Resuming mining..."
done