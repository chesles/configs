if [[ -d /usr/local/go ]]; then
  export PATH=/usr/local/go:$PATH

  gopath() {
    export GOPATH=`pwd`
  }
fi
