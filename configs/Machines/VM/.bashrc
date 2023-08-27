export ST_CONF="$HOME/dotfiles/configs"

export ST_TARGET_MACHINE="VM"
export ST_TARGET_SYS="Ubuntu"
export USER="dev"

source "$ST_CONF/bash/.bashrc"
source "$ST_CONF/bash/.bash_aliases"
source "$ST_CONF/bash/.bash_private"
source "$ST_CONF/Platforms/Ubuntu/.bash_profile"
source "$ST_CONF/Environments/Ford/.bash_ford"

alias luamake=/home/stabei/.local/share/lua-language-server/3rd/luamake/luamake
