source ~/.bashrc

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/dotfiles/configs/zsh//.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export HISTFILE=~/.local/state/bash/zhistory
export HISTSIZE=1000000
export SAVEHIST=100000
setopt autocd extendedglob nomatch notify INC_APPEND_HISTORY_TIME
unsetopt beep
bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
zstyle :compinstall filename '/home/stabei/.zshrc'
zstyle ':completion:*' menu select
autoload -Uz compinit
compinit

# Theme, install the theme with :  
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.local/share/powerlevel10k

PK10=~/.local/share/powerlevel10k/powerlevel10k.zsh-theme
if [[ -f ${PK10} ]]; then
    source ${PK10} 
else
    echo PK10 not found
fi

# git clone https://github.com/supercrabtree/k.git ~/.local/zsh_plugs/k
K_LS=~/.local/share/zsh_plugs/k/k.sh
if [[ -f ${K_LS} ]]; then
    source ${K_LS} 
else
    echo K_LS not found
fi

[[ ! -f ~/dotfiles/configs/zsh/.p10k.zsh ]] || source ~/dotfiles/configs/zsh/.p10k.zsh
