lpass-ansible-vault-keyfile() {
    [ -z "$1" ] && echo "Item name not specified" && return 1
    lpass show --password "$1-ansible-key" > ~/.ansible/vaultkey.txt
    [ $? = 0 ] || return 1
    chmod 0600 ~/.ansible/vaultkey.txt
    export ANSIBLE_VAULT_PASSWORD_FILE=$HOME/.ansible/vaultkey.txt
}

lpass-aws-keys() {
    [ -z "$1" ] && echo "Item name not specified" && return 1
    export AWS_ACCESS_KEY_ID
    AWS_ACCESS_KEY_ID=$(lpass show --username $1)
    [ $? = 0 ] || return 1
    export AWS_SECRET_ACCESS_KEY
    AWS_SECRET_ACCESS_KEY=$(lpass show --username $1)
}
