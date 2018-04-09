# Always use gpg2 if it exists
if [ -f /usr/bin/gpg2 ]; then
    alias gpg=gpg2
fi
