function lpass-aws-keys {
    [ -z "$1" ] && echo "Item name not specified" && return 1
    export AWS_ACCESS_KEY_ID=`lpass show --field=AWS_ACCESS_KEY_ID aws-keys-$1`
    [ $? == 0 ] || return 1
    export AWS_SECRET_ACCESS_KEY=`lpass show --field=AWS_SECRET_ACCESS_KEY aws-keys-$1`
}


#function lpass-ansible-vault-keyfile {
#    [ -z "$1" ] && echo "Item name not specified" && return 1
#    lpass show --password $1 > ~/.ansible/vaultkey.txt
#    [ $? == 0 ] || return 1
#    chmod 0600 ~/.ansible/vaultkey.txt
#    export VAULT_PASSWORD_FILE=$HOME/.ansible/vaultkey.txt
#}
