alias ls='ls -hF  --color=tty --group-directories-first'
alias ll='ls -alF --color=tty --group-directories-first'
alias l='ls  -aCF --color=tty --group-directories-first -1'
alias ..='cd ..'
alias grep='grep --color'
alias hgrep='history|grep'

alias vim="vim -u $XDG_CONFIG_HOME/nvim/vimrc"
alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"

alias tx='tmux attach || tmux'
alias vi='vim'
alias nv="nvim"
alias nd="neovide"

alias tree='tree -C'
alias fd="fdfind"
alias G='git'
alias gs="git status"
alias E='exit'

function f(){
    find . -type "$1" -iname "$2" 2>/dev/null
}

alias D='cd $HOME/dotfiles'
alias N='cd $HOME/notes'
