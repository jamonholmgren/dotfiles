# URL shortener scripts by Jamon Holmgren, 2020-02-19
# License: MIT
#
# Setup:
#  1. Follow Kent C. Dodds' video to create a new URL shortener with Netlify: https://www.youtube.com/watch?v=HL6paXyx6hM
#  2. Clone it to your local machine (I put it in ~/Code/shortener)
#  3. Modify this file to point to the right file
#  4. Add `source ~/path/to/this/shortner.zsh` to your .zshrc (note this was only tested with zsh)
# 
# Usage:
#  shorten example https://example.com # This creates a mydomain.me/example redirect
#  shorten_undo     # This undoes the previous redirect
#  shorteners       # This lists all shortened URLs
#  shorten_doctor   # If your shortener git needs to be reset, run this

# Lists shorteners
shorteners() {
    cat ~/Code/shortener/_redirects
}

shorten() {
    # Rough test for URL in the wrong place
    [[ "$1" =~ ":" ]] && echo "Please use the format: shorten shortname <url>" && return;

    # Jump into shortener URL
    cd ~/Code/shortener

    # Prepend the new redirect to the shortener
    echo "$(echo "/$1 $2"; cat ./_redirects)" > ./_redirects

    # Push to github
    git add ./_redirects
    git commit -m "Added /$1" --quiet
    git push origin master --quiet
    
    # Return to previous folder
    cd -

    echo "Added redirect:"
    echo "https://jamon.me/$1"
}

shorten_undo() {
    # Undoes last commit
    cd ~/Code/shortener
    git reset --hard HEAD~1 --quiet
    git push --force origin master --quiet
    cd -

    shorteners;
}

shorten_doctor() {
    cd ~/Code/shortener
    git reset --hard --quiet
    cd -

    echo "Reset shortener git status"
}
