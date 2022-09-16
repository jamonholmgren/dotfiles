alias wp="./node_modules/.bin/webpack"

alias npx="nice -n 9 \npx"
alias pod="nice -n 9 \pod"
alias yarn="nice -n 10 \yarn"

alias yi="nice -n 10 \yarn install 2> >(grep -v warning 1>&2)"

export PATH="$HOME/.yarn/bin:$PATH"
