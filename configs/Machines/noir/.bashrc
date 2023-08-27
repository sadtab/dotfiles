export ST_CONF="$HOME/dotfiles/configs"

export ST_TARGET_MACHINE="NOIR"
export ST_TARGET_SYS="Ubuntu"

source "$ST_CONF/bash/.bashrc"
source "$ST_CONF/bash/.bash_aliases"
source "$ST_CONF/bash/.bash_private"
source "$ST_CONF/Platforms/Ubuntu/.bash_profile"

# Remplacer PS1 de bahcrc,
export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]ST@$ST_TARGET_MACHINE\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\e[33m\]`my_git_ps1`\[\e[0m\]\n\$ '

alias luamake=/home/stabei/.local/share/lua-language-server/3rd/luamake/luamake
