# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#Configure Vim SuperMan for reading unix "man" pages faster than light

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

######################
##	ALIASES     ##
######################

#alias ls='ls -GFh' #list with a little flair ;) 

#TMUX Aliases
alias lts='tmux list-session ' #list all currently active tmux sessions
alias kts='tmux kill-session -t ' #eg 'kt 1'
alias ltp='tmux list-pane'
alias ktp='tmux kill-pane -t'
alias lw='tmux list-window ' #list tmux active windows
alias kw='tmux kill-window -t ' #kill tmux window <id>
alias s='tmux switch -t '
#alias redshift='/etc/init.d/redshift_onstartup.sh'
alias v='vimx'

# list all as list in filetype/extension order
alias lsl='ls -lX'


##########################
##	FUNCTIONS	##
##########################

# update local github repo in current working directory
git-update()
{
	if [[ $# < 2 ]] ; then
		echo 'Not enough parameters given, check file and commit message. Aborting'
	else
		git add "$1" && git commit -m "$2" && git push origin master
		return
	fi
}

# remove a file and update local github repo in current working directory
git-rm()
{
	git rm "$1" && git commit -m "$2" && git push origin master
}

#Configure Vim SuperMan for reading unix "man" pages faster than light
vman() {
	  vim -c "SuperMan $*"

	  if [ "$?" != "0" ]; then
		  echo "No manual entry for $*"
	  fi
}

# when changing directories automatically list what is in them
[ -z "$PS1" ] && return
function cd() {
    new_directory="$*";
    if [ $# -eq 0 ]; then 
        new_directory=${HOME};
    fi;
    builtin cd "${new_directory}" && ls -F
}

# update remote .bashrc in dotfiles repo
update-bashrc() {
	initial_working_directory=$(pwd)
	rm /home/dan/code/dotfiles/Fedora/.bashrc && 
	cp /home/dan/.bashrc /home/dan/code/dotfiles/Fedora/ &&
	cd /home/dan/code/dotfiles/Fedora &&
	if [[ $# < 1 ]] ; then
		echo 'No arguments specified, try a adding commit message'
		return
	else
			git-update .bashrc "$1"
	fi
	cd $initial_working_directory
}

#update remote installed.txt in installed repo
update-installed() {
	cd /home/dan/Documents/installed/Fedora &&
	git-update installed.txt "$1" 
}

##########################################
##	ENVIRONMENT VARIABLES/MISC	##
##########################################

complete -o default -o nospace -F _man vman #tab completion for SuperMAN pages vim plugin
export CXX=/usr/local/gcc-4.9.4
export EVENT_NOEPOLL=1 #SlimuxREPLSendLine freeze fix

#custom built-from-source gcc-4.9.4
export PATH=/usr/local/bin/gcc-4.9.4/bin:$PATH

#CUDA Environment
export CUDA_HOME=/usr/local/cuda-7.5 
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64 
 
PATH=${CUDA_HOME}/bin:${PATH} 
export PATH

