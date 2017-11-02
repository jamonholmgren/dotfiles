alias mm="bundle exec middleman"
alias mms="bundle exec middleman 2> >(grep -v 'by Slim::Engine' 1>&2)"
alias migrate="rake db:migrate RAILS_ENV=test; rake db:migrate RAILS_ENV=development"

alias rake="bundle exec rake"
alias rspec="bundle exec rspec"
alias guard="bundle exec guard -c"

alias b="bundle"
alias be="bundle exec"

export PATH=$PATH:/Users/jh/.rubies/ruby-2.2.3/bin

source /usr/local/opt/chruby/share/chruby/chruby.sh
