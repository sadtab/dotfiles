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
            require("keymaps").gitsign(gs)
        end,
    }
}
