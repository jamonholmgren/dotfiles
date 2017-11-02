source $ZSH/oh-my-zsh.sh

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# ZSH_THEME="random" # To discover new themes
# Favorites: sunrise, apple, jbergantine, gozilla
ZSH_THEME="gozilla"
DISABLE_UPDATE_PROMPT=true

plugins=(
  git
  bundler
  osx
  rake
  ruby
  jsontools
  brew
  alias-tips
)
