sudo apt update && sudo apt upgrade -y
sudo apt install curl unzip -y
curl -o commandlinetools.zip https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
unzip commandlinetools.zip -d $HOME/Android/Sdk
echo 'set -x ANDROID_SDK_ROOT $HOME/Android/Sdk' >> ~/.config/fish/config.fish
echo 'set -x PATH $ANDROID_SDK_ROOT/cmdline-tools/latest/bin $PATH' >> ~/.config/fish/config.fish
source ~/.config/fish/config.fish
sdkmanager --install "platform-tools" "build-tools;30.0.3"
adb --version
