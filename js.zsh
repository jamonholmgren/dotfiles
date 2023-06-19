# alias wp="./node_modules/.bin/webpack"

# alias npx="nice -n 9 \npx"
# alias pod="nice -n 9 \pod"
# alias yarn="nice -n 10 \yarn"

# asdf nodejs
. $(brew --prefix asdf)/libexec/asdf.sh

# alias yi="nice -n 10 \yarn install 2> >(grep -v warning 1>&2)"

export PATH="$HOME/.yarn/bin:$PATH"

# bun completions
[ -s "/Users/jh/.bun/_bun" ] && source "/Users/jh/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

