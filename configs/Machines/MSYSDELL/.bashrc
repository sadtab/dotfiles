export ST_TARGET_SYS="MSYS2"
export ST_TARGET_MACHINE="MSYSDELL"

source  $HOME/dotfiles/configs/bash/.bashrc
source  $HOME/dotfiles/configs/bash/.bash_aliases
source  $HOME/dotfiles/configs/bash/.bash_private
source  $HOME/dotfiles/configs/Platforms/MSYS2/.bash_profile
cp -f $HOME/dotfiles/configs/Platforms/MSYS2/.minttyrc $HOME/.minttyrc
cp -f $HOME/dotfiles/configs/Platforms/MSYS2/tmux.conf $HOME/.config/tmux/

# Remplacer PS1 de bahcrc,
export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]ST@$ST_TARGET_MACHINE\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\e[33m\]`my_git_ps1`\[\e[0m\]\n\$ '
