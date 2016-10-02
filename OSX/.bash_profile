alias vim='mvim -v' #because CLI_Macvim

alias ls='ls -GFh' #list with a little flair ;) 


#TMUX Aliases
alias lt='tmux list-session' #list all currently active tmux sessions
alias kt='tmux kill-session -t' #eg 'kt 1'
alias lw='tmux list-window' #list tmux active windows
alias kw='tmux kill-window -t' #kill tmux window <id>

export EVENT_NOEPOLL=1
export EVENT_NOKQUEUE=1
export PATH="/usr/local/sbin:$PATH"
