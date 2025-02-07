<!-- @format -->

# Ubuntu Installation Scripts

## How to Run

1. Clone the repository to your local machine.
2. Navigate to the repository directory.
3. Run the `start.fish` script to begin the installation process:
   ```bash
   fish ~/ubuntu_install/start.fish
   ```

## Scripts

### start.fish

This is the main script that initiates the installation process. It prompts the user to show logs, limits internet bandwidth to focus on installation, and runs all other scripts sequentially. It also includes error handling and logging.

### programing.fish

Installs programming tools and dependencies such as g++, clang, cmake, curl, and nvm.

### github.fish

Installs Git and GitHub CLI, configures Git user details, and prompts the user to log in to GitHub.

### docker.fish

Installs Docker and its dependencies, configures Docker to start on boot, and adds the current user to the Docker group.

### android_sdk.fish

Downloads and installs the Android SDK, configures the path, installs adb, and updates the Android SDK automatically.

### vscode.fish

Downloads and installs Visual Studio Code, verifies the installation, and cleans up temporary files.

### update-all.fish

Updates all installed packages and software, including nvm, system packages, Android SDK, flatpak packages, Docker, and Virtual Machine Manager. It includes error handling and logging.

### education.fish

Installs educational and productivity tools using flatpak, including Obsidian, Okular, OBS Studio, Anki, Zen Browser, LibreWolf, and LibreOffice.

### config.fish

Configures the fish shell with custom aliases and functions for SSD status checks and system updates.

## Usage

1. Clone the repository to your local machine.
2. Navigate to the repository directory.
3. Run the `start.fish` script to begin the installation process:
   ```bash
   fish ~/ubuntu_install/start.fish
   ```
4. Follow the prompts and wait for the installation to complete.

## Notes

- Ensure you have the necessary permissions to run the scripts, especially those requiring `sudo`.
- The scripts include error handling and logging to `/var/log/install.log` and `/var/log/update.log`.
- The `start.fish` script limits internet bandwidth during installation to focus on the process. This limit is removed after the installation completes.

## License

This project is licensed under the MIT License.
