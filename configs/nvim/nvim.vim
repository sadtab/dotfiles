augroup NvimAutoGroup
    autocmd!
    autocmd FileType qf nnoremap <space> <CR>
    autocmd FileType undotree nnoremap <space> <CR>
    autocmd FileType TelescopePrompt inoremap <buffer> <silent> <C-r> <C-r>
    autocmd FileType NeogitStatus  nnoremap <CR> :
augroup end

set foldmethod=expr
set cursorlineopt=number
set foldexpr=nvim_treesitter#foldexpr()
set conceallevel=1

colorscheme duskfox

" nvim tree
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" markdown-preview
let g:mkdp_auto_close = 0  
let g:mkdp_filetypes  = ['markdown','plantuml','pu']

"Command alias
cnoreabbrev DO DiffviewOpen
cnoreabbrev DC DiffviewClose
cnoreabbrev DH DiffviewFileHistory %

cnoreabbrev SS SessionSave
cnoreabbrev SR SessionRestore

cnoreabbrev T  Telescope
cnoreabbrev GG Neogit

cnoreabbrev NR Neorg return
cnoreabbrev NN Neorg

" <C-n> and <C-p> to jump in code snips
imap <silent><expr> <C-n> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
inoremap <silent> <C-p> <cmd>lua require('luasnip').jump(-1)<Cr>
snoremap <silent> <C-n> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <C-p> <cmd>lua require('luasnip').jump(-1)<Cr>