# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

export USER="stabei"

source "$HOME/dotfiles/configs/bash/set_commons.sh"
source "$HOME/dotfiles/resources/ford/ford.sh"

ln -nsf  $HOME/dotfiles/resources/ford/gitconf_ford $XDG_CONFIG_HOME/git/gitconf_machine
ln -nsf  $HOME/dotfiles/resources/streamdeck/.streamdeck_ui.json $HOME

if [ -d "/usr/local/texlive/2023/bin/x86_64-linux" ] ; then
    PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"
fi
