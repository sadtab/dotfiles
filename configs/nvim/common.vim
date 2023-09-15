" Auto commands -----------------------------------------{{{1
augroup commonAutoGroup
    "Clear autocmd's of this group
    autocmd!

    "Fold  selective file types
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType fugitive setlocal foldmethod=marker

    "Cursor line
    autocmd BufNewFile,BufRead *.py setlocal colorcolumn=79
    autocmd FileType c,cpp,h,hpp,norg,md setlocal colorcolumn=121
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd VimEnter,WinEnter,BufWinEnter * set showtabline=2
    autocmd WinLeave * setlocal nocursorline

    "Set custom file's syntax
    autocmd BufNewFile,BufRead .bash* set filetype=sh
    autocmd BufNewFile,BufRead *.bb set filetype=sh
    autocmd BufNewFile,BufRead *.service* set ft=systemd
    autocmd BufNewFile,BufRead *.json.* set filetype=json
    autocmd BufNewFile,BufRead *.vim set filetype=vim
    autocmd BufNewFile,BufRead config set filetype=yaml
    autocmd BufNewFile,BufRead gitconf_* set filetype=yaml

    "ClangFormatAutoEnable
    "autocmd FileType c,cpp,hpp,h ClangFormatAutoEnable

    "Set expandtab
    autocmd FileType c,cpp,h,hpp,txt,py setlocal tabstop=4 expandtab

augroup END

" Vim configuration -------------------------------------{{{1
set tabstop=4
set showtabline=2
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set autowrite
set wildmenu
set wildmode=longest:full,full
set hlsearch
set mouse=a
set foldlevelstart=20
set diffopt+=vertical
set termguicolors
set timeout
set timeoutlen=500
set updatetime=300
set undofile
set ignorecase
set smartcase
set textwidth=120
set signcolumn=yes
set completeopt=menuone,noselect
set spellfile=~/.local/state/nvim/spell/en.utf-8.add
set diffopt+=iwhite


"syntax should be enables after autocmd commands to make shell folding work
syntax enable

" Mapping -----------------------------------------------{{{1

" Keymaps form semi-gods
let mapleader = ";"

" <CR> -> :
nnoremap <CR> :
vnoremap <CR> :
noremap <leader><CR> <CR>

" Dot remap
nmap <space><space> .

" # and <S-#> for next/previous char with f/F and t/T
noremap # ;
noremap ~ ,

" Use , to toggle uppercase/lowercase
noremap , ~

" if u is undo, U is redo
nnoremap U <C-R>

" Esc in terminal
tnoremap <Esc> <C-\><C-n>

" Split screen | _
nnoremap _  :sp<CR>
nnoremap \| :vs<CR>

"Map H/L to Beginning and end of line
nnoremap H ^
nnoremap L g_
vnoremap H ^
vnoremap L g_

"Map jk to exit insert mode
inoremap jj <esc>
inoremap kk <esc>
inoremap jk <esc>
inoremap jk <esc>

" Keep currnt line in the center
nnoremap <leader>Z  :let &scrolloff=999-&scrolloff<CR>

"tap // to search visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" delete without yanking : Shift Delete
nnoremap D "_d
vnoremap D "_d

"Yank to clipboard
vnoremap Y "+y

"New tab
nnoremap <leader>T :tabnew<CR>

"Quit
noremap Q :q<CR>

"Window resizing
noremap <Up>      <C-W>2+
noremap <Down>    <C-W>2-
noremap <Left>    <c-w>2<
noremap <Right>   <c-w>2>

" Move visually selected
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

"Mapping of \
nnoremap \v :tabnew $XDG_CONFIG_HOME/nvim/common.vim<CR>
nnoremap \t :tabnew $XDG_CONFIG_HOME/tmux/tmux.conf<CR>
nnoremap \f :tabnew ~/dotfiles/configs/Environments/Ford/.bash_ford<CR>
nnoremap \y :tabnew $XDG_CONFIG_HOME/clangd/config.yaml<CR>
nnoremap \s <Esc>]s<Esc>:sleep 300m<CR>1z=<Esc>:sleep 300m<CR>u<Esc>:sleep 300m<CR><C-r>
nnoremap \S <Esc>:setlocal spell!<CR>
nnoremap \F <Esc>:set spell spelllang=fr<CR>
nnoremap \E <Esc>:set spell spelllang=en<CR>
nnoremap \w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Insert a blank line below or above current line (do not move the cursor),
nnoremap <expr> oo printf('m`%so<ESC>``', v:count1)
nnoremap <expr> OO printf('m`%sO<ESC>``', v:count1)

" Plugin related
nnoremap <space>u :UndotreeToggle<CR>

" Expand pane to a new tab
noremap <C-w>z :tab split<CR>

" Don't jump with *
nnoremap * :keepjumps normal! mi*`i<CR>
nnoremap <C-i> <C-i>

" Functions and DIYs --------------------------------{{{1
" Clears hlsearch after doing a search, otherwise just does normal <esc> stuff
nnoremap <expr> <Esc> {-> v:hlsearch ? ":nohl\<CR>" : "\<Esc>"}()

" Plugin configuration ------------------------------{{{1
" tmux-vim pane navigation --------------------------{{{2

" Activate autoupdate on exit
"let g:tmux_navigator_save_on_switch = 1

" Disable vim->tmux navigation when the Vim pane is zoomed in tmux
let g:tmux_navigator_disable_when_zoomed = 1

" Delete in command mode like shell
cnoremap <M-BS>  <C-w>

" If the Vim pane is zoomed, stay zoomed when moving to another tmux pane
"let g:tmux_navigator_preserve_zoom = 1

" Enable custom Key Bindings
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>
tnoremap <silent> <C-h> <C-\><C-n>:TmuxNavigateLeft<cr>
tnoremap <silent> <C-j> <C-\><C-n>:TmuxNavigateDown<cr>
tnoremap <silent> <C-k> <C-\><C-n>:TmuxNavigateUp<cr>
tnoremap <silent> <C-l> <C-\><C-n>:TmuxNavigateRight<cr>
tnoremap <silent> <C-\> <C-\><C-n>:TmuxNavigatePrevious<cr>
inoremap <silent> <C-h> <Esc>:TmuxNavigateLeft<cr>
inoremap <silent> <C-j> <Esc>:TmuxNavigateDown<cr>
inoremap <silent> <C-k> <Esc>:TmuxNavigateUp<cr>
inoremap <silent> <C-l> <Esc>:TmuxNavigateRight<cr>
inoremap <silent> <C-\> <Esc>:TmuxNavigatePrevious<cr>

" Legacy mappings
"nnoremap <silent> <C-h> <C-w>h
"nnoremap <silent> <C-j> <C-w>j
"nnoremap <silent> <C-k> <C-w>k
"nnoremap <silent> <C-l> <C-w>l
"nnoremap <silent> <C-\> <C-w>w
"tnoremap <silent> <C-h> <C-\><C-n><C-w>h
"tnoremap <silent> <C-j> <C-\><C-n><C-w>j
"tnoremap <silent> <C-k> <C-\><C-n><C-w>k
"tnoremap <silent> <C-l> <C-\><C-n><C-w>l
"tnoremap <silent> <C-\> <C-\><C-n><C-w>w

" Undotree ------------------------------------------{{{2
let g:undotree_WindowLayout = 3
let g:undotree_SplitWidth = 60
let g:undotree_DiffpanelHeight = 30
