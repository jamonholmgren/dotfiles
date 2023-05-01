# warning: this is very much untested and alpha quality
# it will install brew, oh-my-zsh, and a bunch of other things
# use at your own risk
setup_jamon_environment () {
  # homebrew
  # /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  
  # zsh and lots of other cool things -- DISABLED
  # brew install --without-docs node git zsh zsh-completions zsh-syntax-highlighting ccat ripgrep exa trash hub
  
  # newer macs 
  brew install zsh-completions zsh-syntax-highlighting ccat z trash

  # oh-my-zsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  
  # pureprompt
  # yarn global add pure-prompt
  npm install -g pure-prompt

  # elixir
  # \curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s

  # bun https://bun.sh/
  curl -fsSL https://bun.sh/install | bash
}
