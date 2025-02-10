# Update and Install JDK 17
sudo apt-get update
sudo apt-get install -y openjdk-17-jdk

# Install required packages
sudo apt-get install -y wget unzip git

# Create Android directory
mkdir -p $HOME/Android/Sdk

# Download and install Android command line tools
cd $HOME/Android/Sdk
wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
unzip commandlinetools-linux-11076708_latest.zip
mkdir -p cmdline-tools/latest
mv cmdline-tools/* cmdline-tools/latest/
rmdir cmdline-tools

# Set up environment variables in Fish shell
echo 'set -x ANDROID_HOME $HOME/Android/Sdk' >> $HOME/.config/fish/config.fish
echo 'set -x PATH $PATH $ANDROID_HOME/emulator' >> $HOME/.config/fish/config.fish
echo 'set -x PATH $PATH $ANDROID_HOME/platform-tools' >> $HOME/.config/fish/config.fish
echo 'set -x PATH $PATH $ANDROID_HOME/cmdline-tools/latest/bin' >> $HOME/.config/fish/config.fish

# Install Android SDK components
yes | sdkmanager --licenses
sdkmanager "platform-tools" "platforms;android-35" "build-tools;35.0.0"

# Install React Native CLI
npm install -g react-native-cli

# Set up your phone for development:
# 1. Enable Developer Options on your Android phone.
# 2. Enable USB Debugging in the Developer Options.
# 3. Connect your Android phone via USB.

# Verify the connection of your phone (this step should be done after connecting the device)
adb devices

# Make sure your phone shows up in the list of devices. If it does, your device is ready for React Native development.

echo "React Native development environment setup complete! You can now run your app on your physical device."
