# React Native Android dev
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK=$ANDROID_HOME
# export ANDROID_NDK=$ANDROID_HOME/ndk/android-ndk-r10e
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

alias pixel2="$ANDROID_HOME/emulator/emulator -netdelay none -netspeed full -no-snapshot-save -avd Pixel_2_API_28"
