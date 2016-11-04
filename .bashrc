if [ -f ~/.profile ]; then 
    source ~/.profile 
fi

### Added by the Heroku Toolbelt
if [ -d /usr/local/heroku ]; then
    export PATH="/usr/local/heroku/bin:$PATH"
fi
