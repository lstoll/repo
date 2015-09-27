DFDIR="$(cd $(dirname $0)/.. && pwd)"
ENVDIR=$DFDIR/env.d

export PATH=$DFDIR/bin:$PATH

for f in $ENVDIR/*.sh ; do
  if [ -f $f ] ; then
    source $f
  fi
done
