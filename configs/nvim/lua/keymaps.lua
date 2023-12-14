-------------
-- keymaps --
-------------
--  For lazy loaded plugins, require should be wrapped as <cmd>lua require("module")<cmd>
--  Other wise the module will be loaded right away

local helpers = require("helpers")

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
vim.keymap.set('n', '<leader>t', "<cmd>TodoTelescope<CR>",
    { noremap = true, silent = true, desc = "Telescope Todos" })
vim.keymap.set('n', '<leader>b', "<cmd>Telescope buffers<CR>",
    { noremap = true, silent = true, desc = "Show open Buffers" })

-- LSP
vim.keymap.set('n', '<space>w', vim.diagnostic.open_float,
    { noremap = true, silent = true, desc = "What ?! (Diagnostic of line)" })
vim.keymap.set('n', '<space>[', vim.diagnostic.goto_prev,
    { noremap = true, silent = true, desc = "Diagnostics Previous" })
vim.keymap.set('n', '<space>]', vim.diagnostic.goto_next,
    { noremap = true, silent = true, desc = "Diagnostics Next" })
vim.keymap.set('n', '<space>o', '<C-o>',
    { noremap = true, silent = true, desc = "Jump out ( Handy <C-o> )" }) -- faster jump back
vim.keymap.set('n', '<space>i', '<C-i>',
    { noremap = true, silent = true, desc = "Jump in ( Handy <C-i> )" })  -- faster jump next
vim.keymap.set('n', '<leader>l', '<cmd>LspStart<CR>',
    { noremap = true, silent = true, desc = "LSP Start" })
vim.keymap.set('n', '<leader>L', '<cmd>LspStop<CR>',
    { noremap = true, silent = true, desc = "LSP Stop" })
vim.keymap.set('n', '<leader>LL', '<cmd>LspRestart<CR>',
    { noremap = true, silent = true, desc = "LSP Restart" })

-- Misc
vim.keymap.set('n', '<leader><leader>', "<cmd>NvimTreeToggle<CR>",
    { noremap = true, silent = true, desc = "Tree toggle" })
vim.keymap.set('n', '<space>m', '<cmd>lua require("mini.map").toggle()<CR>',
    { noremap = true, silent = true, desc = "Minimap toggle" }) -- Lazy loader
vim.keymap.set('n', '<space>F', "<cmd>Twilight<CR>",
    { noremap = true, silent = true, desc = "Focus (Twilight)" })
vim.keymap.set('n', '<space>l', "<cmd>IlluminateToggle<CR>",
    { noremap = true, silent = true, desc = "Illuminate toggle" }) -- Lazy loader
vim.keymap.set('n', '<space>z', "<cmd>ZenMode<CR>",
    { noremap = true, silent = true, desc = "Zen Mode" })          -- Lazy loader

-- Neorg
vim.keymap.set('n', '<space>nw', '<cmd>Neorg workspace work<CR>',
    { noremap = true, silent = true, desc = "Work workspace" })
vim.keymap.set('n', '<space>np', '<cmd>Neorg workspace perso<CR>',
    { noremap = true, silent = true, desc = "Perso workspace" })
vim.keymap.set('n', '<space>J', '<cmd>Neorg journal today<CR>',
    { noremap = true, silent = true, desc = "Journals" })

-- <Bslash>
vim.keymap.set('n', '<Bslash>c', helpers.ConfMenu,
    { noremap = true, silent = true, desc = "Open configs" })
vim.keymap.set('n', '<Bslash>n', helpers.NoteMenu,
    { noremap = true, silent = true, desc = "Open Neorg Notes" })
vim.keymap.set('n', '<Bslash>d', helpers.DotMenu,
    { noremap = true, silent = true, desc = "Open Dotfiles" })
vim.keymap.set('n', '<Bslash>o', '<cmd>ObsidianQuickSwitch<CR>',
    { noremap = true, silent = true, desc = "Open Obsidian Files" })
vim.keymap.set('n', '<Bslash>t', '<cmd>lua require("FTerm").open()<CR>',
    { noremap = true, silent = true, desc = "Terminal (floating)" }) -- lazy loader

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


local plugin_keymaps = {}

plugin_keymaps.lsp = function(client, bufnr)
    vim.keymap.set('n', '<space>d', vim.lsp.buf.definition,
        { noremap = true, silent = true, buffer = bufnr, desc = "Goto definition" })
    vim.keymap.set('n', '<space>a', '<cmd>CodeActionMenu<CR>',
        { noremap = true, silent = true, buffer = bufnr, desc = "Show action" })
    vim.keymap.set('n', '<space>r', ":IncRename ",
        { noremap = true, silent = true, buffer = bufnr, desc = "Rename References" })
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end,
        { noremap = true, silent = true, buffer = bufnr, desc = "Format file" })
    vim.keymap.set('n', '<space>k', '<cmd>lua require("goto-preview").goto_preview_definition()<CR>',
        { noremap = true, silent = true, buffer = bufnr, desc = "Floating Definition" })
    vim.keymap.set('n', '<space>K', '<cmd>lua require ("goto-preview").close_all_win()<CR>',
        { noremap = true, silent = true, buffer = bufnr, desc = "Floating Definition Close" })
    vim.keymap.set('n', '<space>S', "<cmd>SymbolsOutline<CR>",
        { noremap = true, silent = true, desc = "Symbols Outline Tags" })
    vim.keymap.set('n', '<space>D', "<cmd>Trouble workspace_diagnostics<CR>",
        { noremap = true, silent = true, desc = "Trouble Diagnostics" })
    vim.keymap.set('n', '<space>R', "<cmd>Trouble lsp_references<CR>",
        { noremap = true, silent = true, desc = "Trouble References" })
    if client.server_capabilities.hoverProvider then
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, -- configured with noice
            { noremap = true, silent = true, buffer = bufnr, desc = "Show Hover doc" })
    end
end

plugin_keymaps.clangd = function(bufnr)
    vim.keymap.set('n', '<space>S', "<cmd>ClangdSwitchSourceHeader<CR>",
        { noremap = true, silent = true, buffer = bufnr, desc = "Switch Header/Source" })
    vim.keymap.set('n', '<space>ss', "<cmd>ClangdSwitchSourceHeaderSplit<CR>",
        { noremap = true, silent = true, buffer = bufnr, desc = "Switch in split" })
    vim.keymap.set('n', '<space>sv', "<cmd>ClangdSwitchSourceHeaderVSplit<CR>",
        { noremap = true, silent = true, buffer = bufnr, desc = "Switch in vsplit" })
    vim.keymap.set('n', '<space>I', "<cmd>ClangdToggleInlayHints<CR>",
        { noremap = true, silent = true, buffer = bufnr, desc = "Inlay toggle" })
end

plugin_keymaps.auto_complete = function(cmp)
    return {
        ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-c>"] = cmp.mapping.abort(),
        ["<tab>"] = cmp.config.disable,

        ["<C-space>"] = cmp.mapping.confirm({ select = true }),
    }
end

plugin_keymaps.snip = function(luasnip)
    vim.keymap.set({ "i", "s" }, "<C-n>", function() luasnip.jump(1) end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-p>", function() luasnip.jump(-1) end, { silent = true })
end

vim.keymap.set('n', '<space>g', '<cmd>Gitsigns toggle_signs<CR>', { desc = "Toggle Signs" }) -- Lazy loader

plugin_keymaps.gitsign = function(gs)
    local function next_hunk()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
    end

    local function previous_hunk()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
    end

    vim.keymap.set('n', '<space>.', next_hunk,
        { noremap = true, silent = true, desc = "Git next hunk(>)" })
    vim.keymap.set('n', '<space>,', previous_hunk,
        { noremap = true, silent = true, desc = "Git previous hunk(<)" })
    vim.keymap.set('n', '<space>p', gs.preview_hunk,
        { noremap = true, silent = true, desc = "Preview Hunk" })
    vim.keymap.set('n', '<space>b', function() gs.blame_line { full = true } end,
        { noremap = true, silent = true, desc = "Blame Line" })
    vim.keymap.set({ 'n', 'v' }, '<space>Gs', gs.stage_hunk,
        { noremap = true, silent = true, desc = "Stage Hunk" })
    vim.keymap.set({ 'n', 'v' }, '<space>Gr', gs.reset_hunk,
        { noremap = true, silent = true, desc = "Reset Hunk" })
    vim.keymap.set('n', '<space>Gu', gs.undo_stage_hunk,
        { noremap = true, silent = true, desc = "Undo Stage Hunk" })
    vim.keymap.set('n', '<space>GS', gs.stage_buffer,
        { noremap = true, silent = true, desc = "Stage Buffer" })
    vim.keymap.set('n', '<space>GR', gs.reset_buffer,
        { noremap = true, silent = true, desc = "Reset Buffer" })
    vim.keymap.set('n', '<space>GB', gs.toggle_current_line_blame,
        { noremap = true, silent = true, desc = "Blame Line (Toggele)" })
    vim.keymap.set('n', '<space>Gd', gs.diffthis,
        { noremap = true, silent = true, desc = "Diff this" })
    vim.keymap.set('n', '<space>GD', function() gs.diffthis('~') end,
        { noremap = true, silent = true, desc = "Diff this ~" })
    vim.keymap.set('n', '<space>Gt', gs.toggle_deleted,
        { noremap = true, silent = true, desc = "Toggle Deleted" })
end

plugin_keymaps.illuminate = function(illuminated)
    vim.keymap.set('n', '<C-n>', illuminated.goto_next_reference,
        { noremap = true, silent = true, desc = "Illuminate Next" })
    vim.keymap.set('n', '<C-p>', illuminated.goto_prev_reference,
        { noremap = true, silent = true, desc = "Illuminate Previous" })
end

plugin_keymaps.neoclip = function()
    vim.keymap.set('n', '<space>c', "<cmd>Telescope neoclip<CR>",
        { noremap = true, silent = true, desc = "Clipboard" })
end
return plugin_keymaps
