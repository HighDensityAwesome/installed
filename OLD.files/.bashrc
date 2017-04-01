# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#Configure Vim SuperMan for reading unix "man" pages faster than light

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions


#alias ls='ls -GFh' #list with a little flair ;) 

#TMUX Aliases
alias lt='tmux list-session ' #list all currently active tmux sessions
alias kt='tmux kill-session -t ' #eg 'kt 1'
alias lw='tmux list-window ' #list tmux active windows
alias kw='tmux kill-window -t ' #kill tmux window <id>
alias s='tmux switch -t '
alias redshift='/etc/init.d/redshift_onstartup.sh'
alias v='vim'

#Configure Vim SuperMan for reading unix "man" pages faster than light

vman() {
	  vim -c "SuperMan $*"

	  if [ "$?" != "0" ]; then
		  echo "No manual entry for $*"
	  fi
}

complete -o default -o nospace -F _man vman #tab completion for SuperMAN pages vim plugin
export CXX=/usr/local/gcc-4.9.4
export EVENT_NOEPOLL=1 #SlimuxREPLSendLine freeze fix
