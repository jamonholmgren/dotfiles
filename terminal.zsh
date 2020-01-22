alias show_hidden="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hide_hidden="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"

alias zr="source ~/.zshrc"
alias ze="code ~/Dropbox\ \(Personal\)/Terminal/"
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

# if you're missing pureprompt, install with `npm install --global pure-prompt`
autoload -U promptinit; promptinit
prompt pure

# for zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

