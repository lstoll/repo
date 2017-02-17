function dirtysrc {
    for d in $(find ~/src -name .git -type d); do test -z "$(git -C $(dirname $d) status --porcelain)" || echo "$(dirname $d) has a dirty working copy"; done
}

alias gup='git fetch origin --prune && git rebase origin/$(git rev-parse --abbrev-ref HEAD)'

alias gbranchclean='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
