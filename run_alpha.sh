#!/bin/bash

# ========================================================================
# Melanin OS for Linux  - run_alpha.sh
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

# Function to check if a directory exists and is not empty
is_directory_empty() {
    [ -z "$(ls -A "$1" 2>/dev/null)" ]
}

# Welcome message
echo "Welcome to the Melanin Click setup script!"

# Disclaimer
echo "DISCLAIMER: This script will install software on your system. Ensure you have sufficient permissions and have backed up your important data. Proceeding indicates acceptance of any risks involved."
read -p "Do you agree to continue with the installation? (y/n) " answer
if [[ "$answer" != "y" ]]; then
    log "Installation canceled."
    exit 1
fi

# Check if Melanin Click is already installed
if [ ! -d "$HOME/whive-core" ] || is_directory_empty "$HOME/whive-core"; then
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
    chmod +x melanin_click_alpha.sh

    # Run Melanin Click
    echo "Starting Melanin Click..."
    ./melanin_click_alpha.sh
else
    log "Melanin Click is already installed. Skipping installation."
fi

# Check if Whived is running
if pgrep -x "whived" > /dev/null
then
    log "Whived is already running."
else
    log "Starting Whived..."
    "$install_path/bin/whived" -daemon
fi

# Wait for 3 minutes to allow Whived to connect and update the blockchain
log "Waiting for Whived to connect and update the blockchain. Please wait..."
for i in {180..1}
do
    printf "\rWaiting: %02d seconds remaining..." $i
    sleep 1
done
echo ""
log "Whived has had time to connect and update the blockchain."

# Prompt user for Whive address
while true; do
    read -p "Enter your Whive address (or press Enter to generate a new one): " USER_ADDRESS
    if [[ -z "$USER_ADDRESS" ]]; then
        # Generate new address
        echo "Generating new Whive address..."
        NEWADDRESS=$("$HOME/whive-core/bin/whive-cli" getnewaddress)
        echo "Your new Whive address: $NEWADDRESS"
        break
    elif [[ "$USER_ADDRESS" =~ ^wv1[0-9a-zA-Z]{33}$ ]]; then
        NEWADDRESS="$USER_ADDRESS"
        break
    else
        echo "Invalid Whive address format. Please try again."
    fi
done

# Mining loop
while true; do
    log "Starting Whive miner..."
    $HOME/whive-cpuminer-mc-yespower/minerd -a yespower -o stratum+tcp://206.189.2.17:3333 -u $NEWADDRESS -p c=WHIVE -t $(nproc)

    log "Mining for $MINING_INTERVAL seconds..."
    sleep $MINING_INTERVAL

    log "Stopping miner for rest period of $REST_DURATION seconds..."
    pkill -f minerd

    log "Resting..."
    sleep $REST_DURATION

    log "Resuming mining..."
done