# Melanin OS Installation Guide 001

Transform your Linux system into a Whive mining powerhouse with Melanin OS. Follow these steps to install Melanin OS along with Melanin Click for optimized mining.

## Prerequisites

- Ensure your device is connected to the internet.
- A minimum of 8GB USB drive is required for the installer.
- **Important**: Back up all crucial data from the device intended for Melanin OS installation.

## Step 1: Download Ubuntu OS Installer

1. Navigate to the [Desktop Ubuntu 22.04.4 LTS repository](https://ubuntu.com/download/desktop/thank-you?version=22.04.4&architecture=amd64) OR [Raspberry PI Ubuntu 22.04.4 LTS repository](https://ubuntu.com/download/raspberry-pi/thank-you?version=22.04.4&architecture=desktop-arm64+raspi).
2. Select and save the ISO file of your choice to your local system.

## Step 2: Create a Bootable USB Drive

Use `Rufus` or `balenaEtcher` on Windows or the `dd` command on Linux/macOS to create your bootable USB:

- **Windows (Rufus/balenaEtcher):**
  - Open Rufus/balenaEtcher, select your USB drive, and the downloaded Melanin OS ISO. Click `Start`.

- **Linux/macOS (dd command):**
  - Insert your USB and identify it with `lsblk` or `diskutil list`.
  - Execute:
    ```bash
    sudo dd if=path_to_start_os.iso of=/dev/sdX bs=4M status=progress
    ```
    Replace `path_to_start_os.iso` with the ISO file path and `/dev/sdX` with your USB device identifier.

## Step 3: Install Melanin OS

1. Insert the bootable USB into your device and restart.
2. Access the boot menu (F12/F10/ESC) and select the USB as the boot device.
3. Follow the on-screen prompts to partition (if necessary) and install Melanin OS.

## Step 4: Install Melanin Click for Linux

After OS installation:

1. Open Terminal in Ubuntu.
2. Download `run_alpha.sh`:
    ```bash
    wget https://raw.githubusercontent.com/melaninsolar/melanin_os/alpha/run_alpha.sh
    ```
3. Make it executable:
    ```bash
    chmod +x run_alpha.sh
    ```
4. Run Melanin Click and follow prompts to configure:
    ```bash
    ./run_alpha.sh
    ```

### Detailed Breakdown of `run_alpha.sh`

The `run_alpha.sh` script performs several key functions to ensure your system is prepared for mining:

- **Welcome Message and Disclaimer**: The script begins with a welcome message and a disclaimer to ensure users are aware of the implications of running the script. The user must agree to continue with the installation.

- **Disk Space Check**: The script checks if there is at least 5GB of free space available. If not, the installation is aborted with a message to free up space.

- **Dependency Check and Installation**: The script checks for necessary dependencies and prompts the user to install any that are missing. Dependencies include `git`, `build-essential`, `libcurl4-openssl-dev`, and `aria2`.

- **Downloading and Extracting Whive Binary**: The script downloads the Whive binary using `aria2` for efficient downloading and extracts it to the specified installation directory.

- **Running Whived**: The script checks if Whived is already running. If not, it starts Whived in daemon mode and waits for 3 minutes to allow it to connect and update the blockchain.

- **Creating and Loading Default Wallet**: The script creates a new default wallet if it doesn't exist and ensures it is loaded. This step is crucial for seamless mining operations.

- **Creating Desktop Shortcut for Whive Miner**: A desktop shortcut for the Whive miner is created for easy access. The user can start mining by clicking this shortcut or running the command provided in the interactive message.

- **Interactive Message to the User**: The script concludes with an interactive message providing the next steps to start the Whive-QT wallet and the Whive miner.

## Step 5: Monitor and Configure

- Utilize the Melanin Click UI for monitoring and settings adjustments.
- Stay updated with the [Melanin Click GitHub](https://github.com/melaninsolar/melanin_click) for the latest versions.

## Troubleshooting

For installation issues, consult the Melanin OS and Melanin Click FAQs or community forums.

## Conclusion

You're now set up with Melanin OS and Melanin Click, ready to mine Whive efficiently. Connect with the community on Telegram or Discord for support and tips.

*Note: Adjust installation steps as necessary for your hardware specifications and requirements.*

## Disclaimer

Please ensure you have read and agreed to the terms and conditions of each software before running this installation script. The software is provided "as is", without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose, and noninfringement.

## TODO
- [x] Whive binary download for both MacOS & Linux
- [x] Miner Download for MacOS/Linux
- [x] Add dependencies for MacOS/Linux
- [x] Add user alert/warning ⚠️ on dependency's installation
- [x] Add miner install notification/alert
- [x] Add Whive desktop shortcut for MacOS/Linux
- [x] Disk space check
- [ ] Add guide for script usage
- [x] MacOS CPU miner needs updates for Ventura
- [x] Add GUI for the script
- [x] Display Terms & Conditions in a better way with zenity
- [x] Add Icon to MelaninClick
- [ ] Add Windows OS support
- [ ] Target various MacOS versions/processor platforms
- [ ] Add pruned node feature
- [ ] Update Lightning neutrino with create wallet and new address feature

## Contact Us

If you encounter any issues or have questions, please reach out to us on our GitHub Issues page or join our Telegram Group.

## Contribution

We welcome contributions from the community! If you would like to contribute, please fork the repository and submit a pull request with your changes. For major changes, please open an issue to discuss what you would like to change.

Thank you for using Melanin Click! Happy mining!
