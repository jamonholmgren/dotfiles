alias show_hidden="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hide_hidden="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"

alias zr="source ~/.zshrc"
alias ze="code ~/.zshrc"
alias s="code ."
alias a="a ."

alias ip="ifconfig en0 | grep 'inet'"
alias publicip="curl ipecho.net/plain; echo"

alias clearip="sudo killall -HUP mDNSResponder"
alias clearips="clearip"
# alias please='sudo $(history -p \!\!)' # wat this?

alias notify="terminal-notifier -message"

function dnd () {
  osascript -e "
    tell application \"System Events\" to tell process \"SystemUIServer\"
      key down option
      click menu bar item 1 of menu bar 2
      key up option
    end tell
  "
}

