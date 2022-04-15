alias show_hidden="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hide_hidden="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"

alias zr="source ~/.zshrc"
alias ze="code ~/Dropbox\ \(Personal\)/Terminal/"
alias zcd="cd ~/Dropbox\ \(Personal\)/Terminal/"
alias s="code ."

alias l="exa -al"

alias ip="ifconfig en0 | grep 'inet'"
alias publicip="curl ipecho.net/plain; echo"

alias clearip="sudo killall -HUP mDNSResponder"
alias clearips="clearip"

alias notify="terminal-notifier -message"
alias ct="\cat"
alias cat=ccat

alias rrm="\rm"
alias rm=trash

function dnd () {
  osascript -e "
    tell application \"System Events\" to tell process \"SystemUIServer\"
      key down option
      click menu bar item 1 of menu bar 2
      key up option
    end tell
  "
}

function fixbluetooth () {
  sudo kextunload -b com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport
  sudo kextload -b com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport
}

# if you're missing pureprompt, install with `npm install --global pure-prompt`
# autoload -Uz promptinit
# promptinit
# prompt pure # doesn't seem to work anymore?

function reniceTwitch () {
  sudo renice -n -10 $(pgrep "Twitch")
}

# Usage: 
# change_video_speed PATH_TO_FILE SPEED
# change_video_speed ~/Videos/recording-01-02-2012.mp4 1.5
# Script by Yulian Glukhenko
function change_video_speed {
   file="$1"
   speed="$2"
   video_speed=$((1/speed))
   new_file_name=${file%%.*}
   new_file_ext=${file##*.}
   new_file="${new_file_name}_${speed/\./_}x.${new_file_ext}"

   command="ffmpeg -i ${file} -filter_complex \"[0:v]setpts=${video_speed}*PTS[v];[0:a]atempo=${speed}[a]\" -map \"[v]\" -map \"[a]\" ${new_file}"

   eval $command
}

