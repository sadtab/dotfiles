
# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

#Setting TERM
export TERM=xterm-256color

source  $HOME/dotfiles/configs/bash/set_commons.sh

cp -f $HOME/dotfiles/configs/msys/.minttyrc $HOME/.minttyrc
cp -f $HOME/dotfiles/configs/msys/tmux.conf $HOME/.config/tmux/

# Git git_ps1__ definition
if [ -e /etc/bash_completion.d/git-prompt  ]
then
    source /etc/bash_completion.d/git-prompt
fi

if [ -e /usr/share/git/git-prompt.sh ]
then
	source /usr/share/git/git-prompt.sh
fi

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
