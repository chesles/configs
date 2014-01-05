# initialize rbenv
if [[ -d ~/.rbenv ]]; then
  eval "$(~/.rbenv/bin/rbenv init -)"
  export PATH=~/.rbenv/shims:$PATH
fi
