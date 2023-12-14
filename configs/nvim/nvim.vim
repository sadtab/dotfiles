augroup NvimAutoGroup
    autocmd!
    autocmd FileType qf nnoremap <space> <CR>
    autocmd FileType undotree nnoremap <space> <CR>
    autocmd FileType TelescopePrompt inoremap <buffer> <silent> <C-r> <C-r>
    autocmd FileType NeogitStatus  nnoremap <CR> :

    " <CR> to insert mode
    autocmd TermOpen * nnoremap <buffer> <CR> i
    autocmd TermOpen * startinsert

    " close terminal directly
    autocmd TermClose * execute 'bdelete! ' . expand('<abuf>')
augroup end

set foldmethod=expr
set cursorlineopt=number
set foldexpr=nvim_treesitter#foldexpr()
set conceallevel=1

" colorscheme rose-pine-moon
colorscheme duskfox

" nvim tree
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" markdown-preview
let g:mkdp_auto_close = 0  
let g:mkdp_filetypes  = ['markdown','plantuml','pu']

"Command alias
cnoreabbrev DD DiffviewOpen
cnoreabbrev DC DiffviewClose
cnoreabbrev DH DiffviewFileHistory %

cnoreabbrev SS SessionSave
cnoreabbrev SR SessionRestore

cnoreabbrev T  Telescope
cnoreabbrev GG Neogit

cnoreabbrev NR Neorg return
cnoreabbrev NN Neorg

lua << EOF
vim.api.nvim_create_user_command(
    'CC',
    require("helpers").load_themes,
    { nargs = 0 }
)

vim.api.nvim_create_user_command(
    'Lint',
    function () require('lint').try_lint() end,
    { nargs = 0 }
)
vim.api.nvim_create_user_command(
    'LintOff',
    function () require('lint').try_lint() end,
    { nargs = 0 }
)
EOF
