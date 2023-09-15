-------------
-- keymaps --
-------------

-- Telescope
vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files,
    { noremap = true, silent = true, desc = "Telescope Files" })
vim.keymap.set('n', '<leader>g', require('telescope.builtin').live_grep,
    { noremap = true, silent = true, desc = "Telescope Grep" })
vim.keymap.set('n', '<leader>G', require('telescope').extensions.live_grep_args.live_grep_args,
    { noremap = true, silent = true, desc = "Telescope Grep(Args)" })
vim.keymap.set('n', '<leader>s', require('telescope.builtin').current_buffer_fuzzy_find,
    { noremap = true, silent = true, desc = "Telescope Search current buffer" })
vim.keymap.set('n', '<leader>h', require('telescope.builtin').help_tags,
    { noremap = true, silent = true, desc = "Telescope Helps" })
vim.keymap.set('n', '<leader>d', require('telescope.builtin').diagnostics,
    { noremap = true, silent = true, desc = "Telescope Diagnostics" })
vim.keymap.set('n', '<leader>r', require('telescope.builtin').lsp_references,
    { noremap = true, silent = true, desc = "Telescope References" })
vim.keymap.set('n', '<leader>t', "<cmd>TodoTelescope<CR>",
    { noremap = true, silent = true, desc = "Telescope Todos" })
vim.keymap.set('n', '<leader>b', "<cmd>Telescope buffers<CR>",
    { noremap = true, silent = true, desc = "Show open Buffers" })
vim.keymap.set('n', '<leader>e', "<cmd>Telescope file_browser<CR>",
    { noremap = true, silent = true, desc = "Telescope Explorer" })

-- LSP
vim.keymap.set('n', '<space>w', '<cmd>Lspsaga show_line_diagnostics ++unfocus<CR>',
    { noremap = true, silent = true, desc = "What ?! (Diagnostic of line)" })
vim.keymap.set('n', '<space>[', vim.diagnostic.goto_prev,
    { noremap = true, silent = true, desc = "Diagnostics Previous" })
vim.keymap.set('n', '<space>]', vim.diagnostic.goto_next,
    { noremap = true, silent = true, desc = "Diagnostics Next" })
vim.keymap.set('n', '<space>o', '<C-o>',
    { noremap = true, silent = true, desc = "Jump out ( Handy <C-o> )" }) -- faster jump back
vim.keymap.set('n', '<space>i', '<C-i>',
    { noremap = true, silent = true, desc = "Jump in ( Handy <C-i> )" }) -- faster jump next
vim.keymap.set('n', '<leader>l', '<cmd>LspStart<CR>',
    { noremap = true, silent = true, desc = "LSP Start" })
vim.keymap.set('n', '<leader>L', '<cmd>LspStop<CR>',
    { noremap = true, silent = true, desc = "LSP Stop" })
vim.keymap.set('n', '<leader>LL', '<cmd>LspRestart<CR>',
    { noremap = true, silent = true, desc = "LSP Restart" })
vim.keymap.set('n', '<leader>w', '<cmd>WindowsToggleAutowidth<CR>',
    { noremap = true, silent = true, desc = "Window Focus mode" })

-- Misc
vim.keymap.set('n', '<leader><leader>', "<cmd>NvimTreeToggle<CR>",
    { noremap = true, silent = true, desc = "Tree toggle" })
vim.keymap.set('n', '<space>m', require('mini.map').toggle,
    { noremap = true, silent = true, desc = "Minimap toggle" })
vim.keymap.set('n', '<space>l', "<cmd>IlluminateToggle<CR>",
    { noremap = true, silent = true, desc = "Illuminate toggle" })
vim.keymap.set('n', '<C-n>', require('illuminate').goto_next_reference,
    { noremap = true, silent = true, desc = "Illuminate toggle" })
vim.keymap.set('n', '<C-p>', require('illuminate').goto_prev_reference,
    { noremap = true, silent = true, desc = "Illuminate toggle" })
vim.keymap.set('n', '<space>F', "<cmd>Twilight<CR>",
    { noremap = true, silent = true, desc = "Focus (Twilight)" })

-- Neorg
vim.keymap.set('n', '<space>nw', '<cmd>Neorg workspace work<CR>',
    { noremap = true, silent = true, desc = "Work workspace" })
vim.keymap.set('n', '<space>np', '<cmd>Neorg workspace perso<CR>',
    { noremap = true, silent = true, desc = "Perso workspace" })
vim.keymap.set('n', '<space>J', '<cmd>Neorg journal today<CR>',
    { noremap = true, silent = true, desc = "Journals" })

-- <Bslash>
vim.keymap.set('n', '<Bslash>c', ConfMenu,
    { noremap = true, silent = true, desc = "Open configs" })
vim.keymap.set('n', '<Bslash>n', NoteMenu,
    { noremap = true, silent = true, desc = "Open Neorg Notes" })
vim.keymap.set('n', '<Bslash>d', DotMenu,
    { noremap = true, silent = true, desc = "Open Dotfiles" })
vim.keymap.set('n', '<Bslash>o', '<cmd>ObsidianQuickSwitch<CR>',
    { noremap = true, silent = true, desc = "Open Obsidian Files" })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Saga
vim.keymap.set('n', '<space>T', '<CMD>Lspsaga term_toggle<CR>',
    { noremap = true, silent = true, desc = "Terminal (floating)" })

