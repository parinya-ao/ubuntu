# Install JDK 17
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

# Set up environment variables
echo 'export ANDROID_HOME=$HOME/Android/Sdk' >> $HOME/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/emulator' >> $HOME/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools' >> $HOME/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin' >> $HOME/.bashrc

# Source the updated environment
source $HOME/.bashrc

# Install Android SDK components
yes | sdkmanager --licenses
sdkmanager "platform-tools" "platforms;android-35" "build-tools;35.0.0" "system-images;android-35;google_apis;x86_64"

# Install Watchman dependencies
sudo apt-get install -y libssl-dev libcrypto++-dev pkg-config libtool automake

# Install Watchman from source
cd $HOME
git clone https://github.com/facebook/watchman.git
cd watchman
git checkout v2023.11.20.00
./autogen.sh
./configure
make
sudo make install

# Install React Native CLI
npm install -g react-native-cli

# Create an Android Virtual Device
echo "no" | avdmanager create avd -n RN_Device -k "system-images;android-35;google_apis;x86_64"

echo "React Native development environment setup complete!"
