function dirtysrc {
    for d in $(find ~/src ~/gocode/src -name .git -type d); do test -z "$(git -C $(dirname $d) status --porcelain)" || echo "$(dirname $d) has a dirty working copy"; done
}

alias gup="git fetch origin && git rebase origin/$(git rev-parse --abbrev-ref HEAD)"
