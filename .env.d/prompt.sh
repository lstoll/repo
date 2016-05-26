hg_ps1() {
    hg prompt "{ on {branch}}{ at {bookmark}}{status}{ ↑{outgoing}}{outgoing|count}{ ↓{incoming}}{incoming|count}" 2> /dev/null
}

function parse_git_branch {
  #[ -d .git ] || return 1
  git_status="$($@ -c  status.displayCommentPrefix=true status)" # 2> /dev/null)"
  branch_pattern="^# On branch ([^${IFS}]*)"
  remote_pattern="# Your branch is (.*) of"
  diverge_pattern="# Your branch and (.*) have diverged"
  if [[ ! ${git_status}} =~ "working directory clean" ]]; then
    state="⚡"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote="↑"
    else
      remote="↓"
    fi
  fi
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="↕"
  fi
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
    echo " <${branch}${state}${remote}>"
  fi
}

function vcs_ps1() {
  hg_parent=0
  git_parent=0
  startdir="`pwd`"
  dir=$startdir
  while [ "$dir" != "/" ] && [ "$dir" != "$HOME" ]; do
    if [ -d ".git" ] ; then git_parent=1 ; break ; fi
    if [ -d ".hg" ] ; then hg_parent=1 ; break ; fi
    cd "`dirname "$dir"`"
    dir="`pwd`"
  done
  cd "$startdir"

  # Not working for now - don't have the extension. Saving for the day we care..
  # if [ $hg_parent == 1 ] ; then echo "$(hg_ps1)" ; fi
  if [ $git_parent == 1 ] ; then echo "$(parse_git_branch git)" ; fi
}

export PS1='\u \[\033[1;33m\]\w\[\033[0m\]$(vcs_ps1) $ '