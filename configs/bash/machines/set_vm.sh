# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

source "$HOME/dotfiles/configs/bash/set_commons.sh"
source "$HOME/dotfiles/resources/ford/ford.sh"

ln -nsf  $HOME/dotfiles/resources/ford/gitconf_ford $XDG_CONFIG_HOME/git/gitconf_machine
