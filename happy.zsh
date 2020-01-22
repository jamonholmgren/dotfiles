expressions=(
    "Ready for another fun-filled day full of excitement and adventure?"
    "Remember to stretch!"
    "Remember to drink water!"
    "You got this!"
    "Trying something new?"
    "Yeahhhhh....I'm going to need you to come in Saturday."
    "My car has a cattle-lytic converter. GET IT? CATTLE-LYTIC!"
)
# Seed random generator
RANDOM=$$$(date +%s)

selectedexpression=${expressions[$(($RANDOM % ${#expressions[@]} + 1 ))]}

# Terminal notification is a little more intrusive
# terminal-notifier -message $selectedexpression

# Echoing at the top is cool enough
echo ""
cowsay $selectedexpression
