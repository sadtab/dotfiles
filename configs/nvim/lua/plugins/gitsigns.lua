require('gitsigns').setup {
    signs                   = {
        add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    },
    signcolumn              = false, -- Toggle with `:Gitsigns toggle_signs`
    numhl                   = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl                  = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff               = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir            = {
        interval = 1000,
        follow_files = true
    },
    attach_to_untracked     = false,
    current_line_blame      = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
        delay = 1,
        ignore_whitespace = false,
    },
    sign_priority           = 1,
    update_debounce         = 100,
    status_formatter        = nil, -- Use default
    max_file_length         = 40000,
    preview_config          = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
    yadm                    = {
        enable = false
    },
    on_attach               = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            -- opts.buffer = bufnr TODOST : this line caused issue with :Neorg generate-workspace-index,
            --                     seems git sign is working fine without it
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', '<space>.', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, { expr = true , desc = "Git previous hunk(>)"})

        map('n', '<space>,', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, { expr = true, desc = "Git previous hunk(<)" })

        -- Actions
        map('n', '<space>p', gs.preview_hunk, { desc = "Preview Hunk" })
        map('n', '<space>b', function() gs.blame_line { full = true } end, { desc = "Blame Line" })
        map('n', '<space>g', gs.toggle_signs, { desc = "Toggle Signs" })
        map({ 'n', 'v' }, '<space>Gs', gs.stage_hunk, { desc = "Stage Hunk" })
        map({ 'n', 'v' }, '<space>Gr', gs.reset_hunk, { desc = "Reset Hunk" })
        map('n', '<space>Gu', gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
        map('n', '<space>GS', gs.stage_buffer, { desc = "Stage Buffer" })
        map('n', '<space>GR', gs.reset_buffer, { desc = "Reset Buffer" })
        map('n', '<space>GB', gs.toggle_current_line_blame, { desc = "Blame Line (Toggele)" })
        map('n', '<space>Gd', gs.diffthis, { desc = "Diff this" })
        map('n', '<space>GD', function() gs.diffthis('~') end, { desc = "Diff this ~" })
        map('n', '<space>Gt', gs.toggle_deleted, { desc = "Toggle Deleted" })

    end,
}
