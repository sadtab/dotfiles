return {
    'sindrets/diffview.nvim',
    lazy = true,
    cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
    opts = {
        enhanced_diff_hl = true,        -- See |diffview-config-enhanced_diff_hl|
        file_panel = {
            listing_style = "tree",     -- One of 'list' or 'tree'
        },
        keymaps = {
            disable_defaults = false,     -- Disable the default keymaps
            view = {
                { "n", "<space>", '<cmd>lua require("diffview.actions").select_entry()<CR>',
                    { desc = "Open the diff for the selected entry" } },
                { "n", "gf", '<cmd>lua require("diffview.actions").goto_file()<CR>',
                    { desc = "Goto the current file" } },
                ["<cr>"] = false,
            },

            --   file_panel = {
            file_panel = {
                { "n", "<space>", '<cmd>lua require("diffview.actions").select_entry()<CR>',
                    { desc = "Open the diff for the selected entry" } },
                { "n", "s", '<cmd>lua require("diffview.actions").toggle_stage_entry()<CR>',
                    { desc = "Stage / unstage the selected entry" } },
                { "n", "L", '<cmd>lua require("diffview.actions").open_commit_log()<CR>',
                    { desc = "Open the commit log panel." } },
                { "n", "gf", '<cmd>lua require("diffview.actions").goto_file()<CR>',
                    { desc = "Goto the current file" } },
                { "n", "f", '<cmd>lua require("diffview.actions").listing_style()<CR>',
                    { desc = "Flatten the view" } },
                ["<cr>"] = false,
            },

            file_history_panel = {
                { "n", "L", '<cmd>lua require("diffview.actions").open_commit_log()<CR>',
                    { desc = "Open the commit log panel." } },
                { "n", "<space>", '<cmd>lua require("diffview.actions").select_entry()<CR>',
                    { desc = "Open the diff for the selected entry" } },
                { "n", "gf", '<cmd>lua require("diffview.actions").goto_file()<CR>',
                    { desc = "Goto the current file" } },
                ["<cr>"] = false,
            },
            option_panel = {
                { "n", "<space>", '<cmd>lua require("diffview.actions").select_entry()<CR>',
                    { desc = "Open the diff for the selected entry" } },
                ["<cr>"] = false,
            },
        },
    }
}
