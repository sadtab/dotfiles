### Repository structure
 
This repo is organized in different layers os configurations.
- <u>**Environments**</u> refers to the usage : My personal systems or different work environment like Ford
- <u>**Platforms**</u> refers to the system type : Ubuntu, MSYS2, WSL etc
- <u>**Machines**</u> refers to the actual physical or virtual machine : My personal Dell laptop, My home office tower,
  etc .
- <u>**General**</u> refers to the most top level configs that applies on every thing 

#### Example
**HT** is the name I gave to my home office work tower.
- It is a native Ubuntu machine, so it uses **Platforms->Ubuntu** configs
- It is used for software development at Ford, so it uses **Environment->Ford** configs
- It has it's own specific configs, **Machines->HT**
- It has also the top level configs like every other system I use

Each machine has **.bashrc** file in which the <u>*General*, *Platform*, *Environment* and the *machine*</u> itself is
specified, and all the bash specific files are sourced. A symlink to this file is placed in the home directory to be
sourced automatically. All the machine's specific bash config goes in that file too.

#### General configurations 
These are configurations files that applies on all systems:
```
configs
├── bash
│   ├── .bash_aliases
│   └── .bashrc
├── git
│   ├── config
│   └── exclude
└── tmux
    └── tmux.conf
```
#### Platform (Or profile)
These are OS/system specific configuration files
```
Platforms
├── Ubuntu
│   └── .bash_profile
├── Termux
│   └── .bash_profile
├── MSYS2
│   ├── .bash_profile
│   ├── .gitconfig
│   ├── .minttyrc
│   └── tmux.conf
├── WSL
│   └── .bash_profile
│
.
.
(Extensible)
...
```

#### Environment
The environment defines the context in which the system is used, these configurations can be used on different machines
but they provide certain functionalities

```
Environments
├── Renault
│   ├── .bash_tcr
│   └── gitconf_tcr
├── Ford
│   ├── .bash_ford
│   ├── bash_qemu
│   ├── config.yaml
│   └── gitconf_ford
├── Perso
│   └── gitconf_perso
│
.
.
(Extensible)
```

#### Machine
These are the configuration specific to each physical/virtual machine
```
Machines
├── HT
│   ├── .bashrc
│   ├── gitconf_machine
│   └── Streamdeck
├── MSYSDELL
│   ├── .bashrc
│   ├── .gitconfig
│   └── gitconf_machine
├── noir
│   ├── .bashrc
│   └── gitconf_machine
├── VM
│    ├── .bashrc
│    └── gitconf_machine
│
.
.
(Highly Extensible)
```
### Tools configurations
#### Vim configuration (vimscript) alongside Neovim (lua)
I used to have Vim as my main editor for years before migrating to Neovim, so I came up with a configuration structure
that holds both lua and vimscripts that configures both editors while keeping common configurations in a single place.
They are all placed in the **nvim** directory though. 
```
nvim
├── common.vim         (Vimscript that holds both Vim and Neovim basic configurations)
├── init.lua           (Neovim specific lua       configs)     
├── nvim.vim           (Neovim specific vimscript configs)
├── vimrc              (Vim    specific vimscript configs)     
└── lua                (Neovim specific keymaps, plugins confs etc) 
    ├── keymaps.lua
    └── plugins
        ├── lsp.lua
        ├── octo.lua
        .
        .
```
- __Vim__
    - My personal Vim configs with it's own plugin manager `Vundle`. The vim's config make it only a custom text editor,
- __Neovim__
    - My personal Neovim configs with it's own plugin manager `Packer`. These configs, take leverage of LSP support
      along side of clangd and some other LSP to work with C++ projects and also support for some other languages such
      as Python, Lua, CMake, bashscript, vimscript, json and xml files
    - Some of niche plugins with packer. If interested in any, check the pluging repo at Github :
        - `ingmarlehmann/vim-franca-highlight` : Highlight fidl files
        - `powerman/vim-plugin-AnsiEsc` : Highlight AnsiEsc text
        - `numToStr/Comment.nvim` : A commenting plugin
        - `simrat39/symbols-outline.nvim` : A tree like view for symbols
        - `lewis6991/gitsigns.nvim` :  Very usful for git operation, especially for diffview
        - `rmagatti/goto-preview` :  This is gold, very usfull to preview the definition of word under cursor
        - `sindrets/diffview.nvim` :  Usful for diffviews and merge conflict resolving
        - `RRethy/vim-illuminate` : Dope, jump to the next refrence for the word under the cursor based on treesitter
          parser or LSP
        - `pwntester/octo.nvim` : This one is very nerdy and neat, I review PR's and adress comments on my PR's within
          neovim, it's dope
    - For LSP related plugins see `packer.lua` and `lsp.lua`
    - There is a bunch of classic plugins like Telescope, which-key, tree-sitter and status-line that are configured

### How set up the system :
#### Dispatching config files (These guides is not tested from scratch)
- be sure XDG variables is exported (refer to its [documentation](https://wiki.archlinux.org/title/XDG_Base_Directory)).
 In short it should be something like :
```
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}
mkdir -p $HOME/.local/state/bash
mkdir -p $XDG_CONFIG_HOME/tmux
mkdir -p $XDG_CONFIG_HOME/git
```

- Create machine specific symlinks
```
ln -s path/to/mashine/.bashrc $HOME
ln -s path/to/mashine/misc/Streamdeck/.streamdeck_ui.json $HOME
# Some shells sources $HOME/.profile, so :
echo "source $HOME/.bashrc" > $HOME/.profile
```

- Create symlinks to `XDG_CONFIG_HOME` config directory for the tools' configurations
```
ln -s $HOME/dotfiles/configs/nvim           $XDG_CONFIG_HOME
ln -s $HOME/dotfiles/configs/tmux/tmux.conf $XDG_CONFIG_HOME/tmux/tmux.conf
ln -s $HOME/dotfiles/configs/git/config     $XDG_CONFIG_HOME/git/
ln -s $HOME/dotfiles/configs/git/exclude    $XDG_CONFIG_HOME/git/
ln -s $HOME/dotfiles/configs/config.yaml    $XDG_CONFIG_HOME/clangd/config.yaml
```

On Windows-based systems like MSYS2, symlink is not supported, so just copy the conf files 

#### Set up Vim
  - Install Vundle :
    - `git clone https://github.com/VundleVim/Vundle.vim.git $XDG_DATA_HOME/vim/bundle/Vundle.vim`
    - See its documentation for plugin installation

#### Set up Nvim :
  - Packer :
    - `git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim`
    - See its documentation for plugin installation
  - Install individual modules of LSP separately based on their own documentation

#### Set up Tmux :
  - Install tmp plugin manager:
    - `git clone https://github.com/tmux-plugins/tpm $XDG_CONFIG_HOME/tmux/plugins/tpm`
    - See its documentation for plugin installation

