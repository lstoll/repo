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
    sudo route -n add -net $(docker-machine ls default | awk '/^default/ {start = match($5, "[0-9]{3,3}\."); end = match($5, "\.[0-9]{1,3}:[0-9]{1,6}$"); print substr($5, start, end-start)".0/24"}') -interface $(VBoxManage showvminfo boot2docker-vm --machinereadable | grep hostonlyadapter | cut -d '"' -f 2)
}
