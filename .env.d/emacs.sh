# Opens file in emacs, starting it if not already running
#alias ec="emacsclient -n -a open-emacs-gui.sh"
alias ec="emacsclient -n"
# Opens file in terminal using existing emacs backend, otherwise starts GUI and opens there.
# Could modify to be all terminal, but I like my emacs server running in the GUI
alias et="emacsclient -t -a open-emacs-gui.sh"
# Opens file in new emacs frame, starting GUI emacs if not running.
#alias en="`brew --prefix`/bin/emacsclient -n -c ~/.emacs.d/bin/emacs-gui.sh"
# Because it isn't cleaning up

#function _tmux_switch_to_emacs {
#    tmux select-window -t `tmux list-window | grep -i emacs | cut -d ':' -f 1`
#}

#function ec {
#    emacsclient -n $1
#    _tmux_switch_to_emacs
#}

#alias ec="emacsclient -n && _tmux_switch_to_emacs"
