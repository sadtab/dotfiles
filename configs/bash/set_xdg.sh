# XDG and decluttering
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}

# Custom XDG
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
alias wget='wget --hsts-file=$XDG_CACHE_HOME/wget-hsts'
export GOPATH="$XDG_DATA_HOME/go"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export TEXDIR="$XDG_DATA_HOME/texlive/2023"
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export ZDOTDIR="$HOME/dotfiles/configs/zsh/"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export WEZTERM_CONFIG_FILE="$HOME/dotfiles/configs/wezterm/wezterm.lua"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.local/share/npm/bin" ] ; then
    PATH="$HOME/.local/share/npm/bin:$PATH"
fi

if [ -d "$XDG_DATA_HOME/cargo/bin" ] ; then
    PATH="$XDG_DATA_HOME/cargo/bin:$PATH"
fi

if [ -d "$XDG_DATA_HOME/go/bin" ] ; then
    PATH="$XDG_DATA_HOME/go/bin:$PATH"
fi

if [ -d "/snap/bin" ] ; then
    PATH="/snap/bin:$PATH"
fi

if [ -d "$TEXDIR/bin/x86_64-linux" ] ; then
    PATH="$TEXDIR/bin/x86_64-linux:$PATH"
fi
