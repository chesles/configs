#!/bin/bash

# colors
function color() { echo -ne "\033[38;5;$1m"; }

# fancy $PS1 stuff
prompt_git() {
  git branch &>/dev/null || return 1
  HEAD="$(git symbolic-ref HEAD 2>/dev/null)"
  BRANCH="${HEAD##*/}"
  [[ -n "$(git status 2>/dev/null | \
    grep -F 'working directory clean')" ]] || STATUS="$(color 9)!"
  printf 'git:%s%s' "${BRANCH:-unknown}" "${STATUS}"
}
prompt_hg() {
  hg branch &>/dev/null || return 1
  BRANCH="$(hg branch 2>/dev/null)"
  [[ -n "$(hg status 2>/dev/null)" ]] && STATUS="!"
  printf '(hg:%s)' "${BRANCH:-unknown}${STATUS}"
}
prompt_svn() {
  svn info &>/dev/null || return 1
  URL="$(svn info 2>/dev/null | \
    awk -F': ' '$1 == "URL" {print $2}')"
  ROOT="$(svn info 2>/dev/null | \
    awk -F': ' '$1 == "Repository Root" {print $2}')"
  BRANCH=${URL/$ROOT}
  BRANCH=${BRANCH#/}
  BRANCH=${BRANCH#branches/}
  BRANCH=${BRANCH%%/*}
  [[ -n "$(svn status 2>/dev/null)" ]] && STATUS="!"
  printf '(svn:%s)' "${BRANCH:-unknown}${STATUS}"
}
prompt_vcs() {
  prompt_git || prompt_svn || prompt_hg
}

box() {
  echo -ne  "\0342\0226\0210"
}

last_command_status() {
  if [ $? -ne 0 ]; then
    echo -ne "$(color 9)$(box)$(color 0)"
  else
    echo -ne "$(color 10)$(box)$(color 0)"
  fi
}

export PS1='$(last_command_status) -- $(color 166)\u@\h$(color 0) $(color 4)$(prompt_vcs)\n$(color 2)\w\e$(color 7)\n\$ '

