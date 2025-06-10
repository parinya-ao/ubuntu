#!/bin/bash

# Android SDK Command Line Tools Setup for Web Scraping
# This script sets up minimal Android SDK for automation and web scraping

# Step 1: Install Java Development Kit (required for Android tools)
# OpenJDK 17 is the recommended version for modern Android SDK
echo "Installing Java 17 OpenJDK..."
sudo apt update
sudo apt install openjdk-17-jdk -y

# Step 2: Download Android Command Line Tools
# Check latest version at: https://developer.android.com/studio/index.html#command-line-tools-only
echo "Downloading Android Command Line Tools..."
cd ~/Downloads/

# Download the latest Linux command line tools (update URL if needed)
# The original script used version 13114758. We will use a more generic, recent version.
# Note: You may need to update this URL to the latest version.
curl -O https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip

# Step 3: Create Android SDK directory structure
echo "Setting up Android SDK directory..."
mkdir -p ~/Android/sdk/cmdline-tools/latest

# Step 4: Extract and organize the tools
echo "Extracting command line tools..."
unzip commandlinetools-linux-11076708_latest.zip -d ~/Android/sdk/cmdline-tools/latest/
# The structure inside the zip is 'cmdline-tools', so we move the contents up one level.
mv ~/Android/sdk/cmdline-tools/latest/cmdline-tools/* ~/Android/sdk/cmdline-tools/latest/
rmdir ~/Android/sdk/cmdline-tools/latest/cmdline-tools

# Clean up downloaded files
rm commandlinetools-linux-11076708_latest.zip

# Step 5: Set up environment variables for Bash shell
echo "Configuring environment variables in ~/.bashrc..."
# Set ANDROID_HOME and add tools to PATH
echo '' >> ~/.bashrc
echo '# Android SDK' >> ~/.bashrc
echo 'export ANDROID_HOME=$HOME/Android/sdk' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools' >> ~/.bashrc

# To apply the variables in the current session
export ANDROID_HOME=$HOME/Android/sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Step 6: Accept SDK licenses (required for package installation)
echo "Accepting Android SDK licenses..."
# The 'yes' command pipes 'y' to the license prompts.
yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --licenses

# Step 7: Install minimal packages for web scraping
echo "Installing essential Android packages for web scraping..."
# platform-tools: includes adb for device communication
# platforms: Android API level (adjust version as needed)
# build-tools: for app building and debugging
$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0"

echo "Android SDK setup complete!"
echo "You can now use adb and other Android tools for web scraping automation."
echo "Restart your terminal or run 'source ~/.bashrc' to apply the changes permanently."
