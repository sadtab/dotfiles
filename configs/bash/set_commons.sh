#!/usr/bin/env bash
# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

source "$HOME/dotfiles/configs/bash/set_xdg.sh"
source "$HOME/dotfiles/configs/bash/set_aliases.sh"
source "$HOME/dotfiles/configs/bash/set_privates.sh"

export LESSHISTFILE=-
export IGNOREEOF=5 # Disable Ctrl D to exit the terminal

# append history entries for Bash
if [ -z $ZSH_VERSION ]
then
    #Set infinit History size
    HISTSIZE= HISTFILESIZE=

    # Add timestamp to bash history
    HISTTIMEFORMAT="%F %T "

    # Record History in multiple shells
    export HISTCONTROL=ignoredups:erasedups

    export HISTFILE=$XDG_STATE_HOME/bash/history
    # avoid duplicates..
    shopt -s histappend
    # auto cd
    shopt -s autocd
    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize
    # Disable Ctrl-s Ctrl-q
    stty -ixon
fi

alias my_git_ps1='git log -1 > /dev/null 2>&1 && __git_ps1'
PS1_GIT_BRANCH='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]$USER@$HOSTNAME\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\e[33m\]`my_git_ps1`\[\e[0m\]\n\$ '
export PS1=${PS1_GIT_BRANCH}

# This function defines a 'cd' replacement function capable of keeping,
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
cd_func ()
{
  local x2 the_new_dir adir index
  local -i cnt

  if [[ $1 ==  "--" ]]; then
    dirs -v
    return 0
  fi

  the_new_dir=$1
  [[ -z $1 ]] && the_new_dir=$HOME

  if [[ ${the_new_dir:0:1} == '-' ]]; then
    #
    # Extract dir N from dirs
    index=${the_new_dir:1}
    [[ -z $index ]] && index=1
    adir=$(dirs +$index)
    [[ -z $adir ]] && return 1
    the_new_dir=$adir
  fi

  #
  # '~' has to be substituted by ${HOME}
  [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"

  #
  # Now change to the new dir and add to the top of the stack
  pushd "${the_new_dir}" > /dev/null
  [[ $? -ne 0 ]] && return 1
  the_new_dir=$(pwd)

  #
  # Trim down everything beyond 11th entry
  popd -n +11 2>/dev/null 1>/dev/null

  #
  # Remove any other occurence of this dir, skipping the top of the stack
  for ((cnt=1; cnt <= 10; cnt++)); do
    x2=$(dirs +${cnt} 2>/dev/null)
    [[ $? -ne 0 ]] && return 0
    [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
    if [[ "${x2}" == "${the_new_dir}" ]]; then
      popd -n +$cnt 2>/dev/null 1>/dev/null
      cnt=cnt-1
    fi
  done

  return 0
}

alias cd=cd_func

# Colorize man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
