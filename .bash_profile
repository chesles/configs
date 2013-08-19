export PATH=~/bin:$PATH
export EDITOR=vim

# colors
function color() { echo -ne "\033[38;5;$1m"; }

# fancy $PS1 stuff
prompt_git() {
  git branch &>/dev/null || return 1
  HEAD="$(git symbolic-ref HEAD 2>/dev/null)"
  BRANCH="${HEAD##*/}"
  [[ -n "$(git status 2>/dev/null | \
    grep -F 'working directory clean')" ]] || STATUS="!"
  printf '(git:%s)' "${BRANCH:-unknown}${STATUS}"
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

prompt_char() {
  if [ ${EUID} -eq 0 ]; then
    echo -ne '#'
  else
    echo -ne '$'
  fi
}

last_command_status() {
  if [ $? -ne 0 ]; then
    echo -ne "$(color 196)\xE2\x9C\x97$(color 0)" # red X
  else
    echo -ne "$(color 82)\xE2\x9C\x93$(color 0)" # green check mark
  fi
}

export PS1='$(last_command_status) $(color 4)$(prompt_vcs)$(color 2) \w\e$(color 7)\n$(prompt_char) '

# vi mode
set -o vi
bind -m vi '":e":edit-and-execute-command'

alias json='python -m json.tool'
alias dig='dig +short'
