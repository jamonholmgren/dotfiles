source ./z.sh

function precmd () {
  z --add "$(pwd -P)"
}
