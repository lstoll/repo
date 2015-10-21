# Merge the files
printf "# THIS FILE IS AUTO GENERATED, SEE ~/.ssh/config.in AND ~/.private_ssh_config\n\n" > ~/.ssh/config
cat ~/.ssh/config.in >> ~/.ssh/config
if [ -f ~/.private_ssh_config ]; then
    printf "\n\n# PRIVATE\n\n" >> ~/.ssh/config
    cat ~/.private_ssh_config >> ~/.ssh/config
fi
