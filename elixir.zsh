alias ph="iex -S mix phoenix.server"
alias dg="mix deps.get"

test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"
kiex use 1.4.5 > /dev/null
