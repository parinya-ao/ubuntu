sudo su
mkdir -p ~/Android/Sdk
cd ~/Android/Sdk
curl -o commandlinetools-linux.zip -L "https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip"
unzip commandlinetools-linux.zip -d cmdline-tools
rm commandlinetools-linux.zip
cd cmdline-tools
mkdir latest
mv * latest/
cd latest/bin
yes | ./sdkmanager --sdk_root=$HOME/Android/Sdk "platform-tools" "platforms;android-33" "build-tools;33.0.0"
# Configure the path
set -Ux ANDROID_HOME $HOME/Android/Sdk
set -Ux PATH $ANDROID_HOME/platform-tools $PATH
# Install adb
yes | sudo apt install adb -y
# Clean up
cd ~
rm -rf ~/Android/Sdk/cmdline-tools/latest/bin
exit
echo "Android SDK and adb installed and configured successfully."
# Update Android SDK automatically
yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --update
