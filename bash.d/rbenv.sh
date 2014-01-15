# initialize rbenv
if [[ (-d ~/.rbenv) && !($PATH =~ 'rbenv')]]; then
  eval "$(~/.rbenv/bin/rbenv init -)"
  export PATH=~/.rbenv/bin:$PATH
fi
