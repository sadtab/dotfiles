### My dotfiles
This repo is contains my conf files. Mostly for Neovim(mangaed by Lazy and Mason), Vim(managed by Vundle), Tmux(managed by tpm) and Wezterm.
I use [Dotbot](https://github.com/anishathalye/dotbot) to install my dotfiles.
I'm pretty happy to how tmux is configured with both Vim and Neovim.

### Vim configuration (vimscript) alongside Neovim (lua)
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
    - My personal Neovim configs with it's own plugin manager `lazy`. These configs, take leverage of LSP support
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
    - There is a bunch of classic plugins like Telescope, which-key, tree-sitter and status-line that are configured

### Core concept of how to be consistent in Navigation, creation, resizing and moving Tabs, Panes and Woindows
Vim/Neovim mostly uses Ctrl
Tmux mostly uses Alt
Wezterm mostly uses Alt+Ctrl

|  Env       |       Pane Nav   |     Tab Nav  |   Pane Sizing     |    Tab new    |    Pane New   |     Tab move |
|------------|------------------|--------------|-------------------|---------------|---------------|--------------|
|  Neovim    |         C-hjkl   |      S- < >  |         Arrow     |        C-c    |        S-|-   |      S-Arrow |
|  Tmux      |         M-hjkl   |      M- < >  |       M-Arrow     |        M-c    |        M-|-   |    M-S-Arrow |
|  Wezterm   |       M-C-hjkl   |    M-C- < >  |     M-C-Arrow     |      M-C-c    |      M-C-|-   |  M-C-S-Arrow |
