# Melanin OS Installation Guide 001

Transform your Linux system into a Whive mining powerhouse with Melanin OS. Follow these steps to install Melanin OS along with Melanin Click for optimized mining.

## Prerequisites

- Ensure your device is connected to the internet.
- A minimum of 8GB USB drive is required for the installer.
- **Important**: Back up all crucial data from the device intended for Melanin OS installation.

## Step 1: Download Ubuntu OS Installer

1. Navigate to the [Desktop Ubuntu 22.04.4 LTS repository](https://ubuntu.com/download/desktop/thank-you?version=22.04.4&architecture=amd64) OR [Raspberry PI Ubuntu 22.04.4 LTS repository](https://ubuntu.com/download/raspberry-pi/thank-you?version=22.04.4&architecture=desktop-arm64+raspi)
2. Select and Save the ISO file of your choice to your local system.

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
2. Download run.sh:
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

## Step 5: Monitor and Configure

- Utilize the Melanin Click UI for monitoring and settings adjustments.
- Stay updated with the [Melanin Click GitHub](https://github.com/melaninsolar/melanin_click) for the latest versions.

## Troubleshooting

For installation issues, consult the Melanin OS and Melanin Click FAQs or community forums.

## Conclusion

You're now set up with Melanin OS and Melanin Click, ready to mine Whive efficiently. Connect with the community on Telegram or Discord for support and tips.

*Note: Adjust installation steps as necessary for your hardware specifications and requirements.*