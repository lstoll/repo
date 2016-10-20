if [ -d $HOME/.rbenv/bin ]; then
    export PATH=$HOME/.rbenv/bin:$PATH
fi
if type rbenv >/dev/null 2>&1; then
    eval "$(rbenv init -)"
fi
