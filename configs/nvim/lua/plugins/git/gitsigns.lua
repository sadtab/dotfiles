vim.keymap.set('n', '<space>g', '<cmd>Gitsigns toggle_signs<CR>', { desc = "Toggle Signs" }) -- Lazy loader

return {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    cmd = { 'Gitsigns' },
    opts = {
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

        attach_to_untracked     = true,
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

        on_attach               = function()
            local gs = package.loaded.gitsigns


            -- Navigation
            vim.keymap.set('n', '<space>.', function()
                if vim.wo.diff then return ']c' end
                vim.schedule(function() gs.next_hunk() end)
                return '<Ignore>'
            end, { expr = true, desc = "Git previous hunk(>)" })

            vim.keymap.set('n', '<space>,', function()
                if vim.wo.diff then return '[c' end
                vim.schedule(function() gs.prev_hunk() end)
                return '<Ignore>'
            end, { expr = true, desc = "Git previous hunk(<)" })

            -- Actions
            vim.keymap.set('n', '<space>p', gs.preview_hunk, { desc = "Preview Hunk" })
            vim.keymap.set('n', '<space>b', function() gs.blame_line { full = true } end, { desc = "Blame Line" })
            vim.keymap.set({ 'n', 'v' }, '<space>Gs', gs.stage_hunk, { desc = "Stage Hunk" })
            vim.keymap.set({ 'n', 'v' }, '<space>Gr', gs.reset_hunk, { desc = "Reset Hunk" })
            vim.keymap.set('n', '<space>Gu', gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
            vim.keymap.set('n', '<space>GS', gs.stage_buffer, { desc = "Stage Buffer" })
            vim.keymap.set('n', '<space>GR', gs.reset_buffer, { desc = "Reset Buffer" })
            vim.keymap.set('n', '<space>GB', gs.toggle_current_line_blame, { desc = "Blame Line (Toggele)" })
            vim.keymap.set('n', '<space>Gd', gs.diffthis, { desc = "Diff this" })
            vim.keymap.set('n', '<space>GD', function() gs.diffthis('~') end, { desc = "Diff this ~" })
            vim.keymap.set('n', '<space>Gt', gs.toggle_deleted, { desc = "Toggle Deleted" })
        end,
    }
}
