alias ls='ls -hF  --color=tty --group-directories-first'
alias ll='ls -alF --color=tty --group-directories-first'
alias l='ls  -aCF --color=tty --group-directories-first -1'
alias ..='cd ..'
alias grep='grep --color'
alias hgrep='history|grep'

alias vi='vim'
alias nv="nvim"
alias G='git'
alias gs="git status"
alias E='exit'
alias tx='tmux attach || tmux'

function f(){
    find . -type "$1" -iname "$2" 2>/dev/null
}

alias D='cd $HOME/dotfiles'
alias N='cd $HOME/notes'
alias C='cd -'
