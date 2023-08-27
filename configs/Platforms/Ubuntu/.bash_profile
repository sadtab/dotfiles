# Set vim as default, to be overritten in bash_machine/ bash_{env} by nvim
export EDITOR=vim
export SUDO_EDITOR=/usr/bin/vim

#########################################################
#IMPORTED FROM DEFAULT UBUNTU BASH_PROFILE
# set PATH so it includes user's private bin if it exists
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -f "$HOME/node_modules/tree-sitter-cli/tree-sitter" ] ; then
    PATH="$HOME/node_modules/tree-sitter-cli:$PATH"
fi

function mknvim(){
    NVIM_PATH=$HOME/neovim
    if [ -d $NVIM_PATH ]; then
        pushd $NVIM_PATH
            git clean -xdf
            git pull
            make CMAKE_BUILD_TYPE=RelWithDebInfo
            sudo make install
        popd
    else
        echo "$NVIM_PATH does not exist"
    fi
}
