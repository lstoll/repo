function dm_start {
  docker-machine start default
  dm_env
}

function dm_stop {
  docker-machine stop default
}

function dm_env {
  eval $(docker-machine env default)
}

function dm_vpnfix {
    sudo route -n add -net $(docker-machine ip default | awk 'BEGIN {FS="."};{print $1"."$2"."$3".0/24"}') -interface $(VBoxManage showvminfo default --machinereadable | grep hostonlyadapter | cut -d '"' -f 2)
}
