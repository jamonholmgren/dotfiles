# warning: this is very much untested and alpha quality
# it will install brew, oh-my-zsh, and a bunch of other things
# use at your own risk
setup_jamon_environment () {
  # homebrew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  # zsh and lots of other cool things
  brew install --without-docs node git zsh zsh-completions zsh-syntax-highlighting ccat ripgrep exa trash chruby ruby-install elixir hub
  # oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  # pureprompt
  npm install --global pure-prompt
  # elixir
  \curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s
}
