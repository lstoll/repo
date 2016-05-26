for f in $HOME/.env.d/*.sh ; do
  if [ -f $f ]; then
    source $f
  fi
done
