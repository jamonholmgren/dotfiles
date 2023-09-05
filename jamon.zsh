# Terminal
# source ./setup.zsh        # new Mac setup script
source ./oh-my-zsh.zsh   # load oh-my-zsh
source ./terminal.zsh    # general terminal settings
source ./path.zsh        # path settings
source ./z.zsh           # z fuzzy path finder


# Development
source ./android.zsh     # settings for Android development
source ./xcode.zsh       # settings for Xcode development
source ./reactnative.zsh # settings for React Native development
source ./ruby.zsh        # settings for Ruby development
source ./js.zsh          # settings for JavaScript development
# source ./elixir.zsh      # settings for Elixir development

# source ./elm.zsh         # settings for Elm development
# Source Control
source ./git.zsh         # git-specific settings

# URL shortener
# source ./shortener.zsh   # shorten, shorteners, and shorten_undo

# Fun
# source ./happy.zsh       # easter egg

# Disabled
# source ./deploy.zsh      # a handy deployment script for static websites

# load asdf
. $(brew --prefix asdf)/libexec/asdf.sh
