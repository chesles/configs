# If not running interactively, don't do anything
[[ $- != *i* ]] && return

for f in ~/.bash.d/*.sh; do
  echo -n "."
  . $f
done
echo
