# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# ZSH_THEME="random" # To discover new themes
# Favorites: sunrise, apple, jbergantine, gozilla
ZSH_THEME="gozilla"
DISABLE_UPDATE_PROMPT=true

plugins=(
  git
  bundler
  macos
  rake
  ruby
  jsontools
  brew
  alias-tips
)

# NOTE: alias-tips needs to be cloned into the custom plugins folder
# See: https://github.com/djui/alias-tips#oh-my-zsh

source $ZSH/oh-my-zsh.sh

# zsh syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
