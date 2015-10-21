function dirtysrc {
    for d in $(find . -name .git -type d); do test -z "$(git -C $(dirname $d) status --porcelain)" || echo "$(dirname $d) has a dirty working copy"; done
}
