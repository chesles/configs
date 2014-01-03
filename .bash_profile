for f in ~/.bash.d/*.sh; do
  echo -n "."
  . $f
done
echo
