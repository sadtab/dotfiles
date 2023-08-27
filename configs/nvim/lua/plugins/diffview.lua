local diffview_actions = require("diffview.actions")

require("diffview").setup{
    enhanced_diff_hl = true, -- See |diffview-config-enhanced_diff_hl|
    keymaps = {
        disable_defaults = false, -- Disable the default keymaps
        view = {
            -- The `view` bindings are active in the diff buffers, only when the current
            -- tabpage is a Diffview.
            ["<tab>"]     = diffview_actions.select_next_entry, -- Open the diff for the next file
            ["<s-tab>"]   = diffview_actions.select_prev_entry, -- Open the diff for the previous file
            ["<C-space>"] = diffview_actions.goto_file, -- Open the file in a new split in the previous tabpage
            ["<cr>"]      = false,
        },

        file_panel = {
            listing_style = "list", -- One of 'list' or 'tree'
            ["<space>"]   = diffview_actions.select_entry, -- Open the diff for the selected entry.
            ["s"]         = diffview_actions.toggle_stage_entry, -- Stage / unstage the selected entry.
            ["S"]         = diffview_actions.stage_all, -- Stage all entries.
            ["U"]         = diffview_actions.unstage_all, -- Unstage all entries.
            ["X"]         = diffview_actions.restore_entry, -- Restore entry to the state on the left side.
            ["R"]         = diffview_actions.refresh_files, -- Update stats and entries in the file list.
            ["L"]         = diffview_actions.open_commit_log, -- Open the commit log panel.
            ["<c-u>"]     = diffview_actions.scroll_view(-0.25), -- Scroll the view up
            ["<c-d>"]     = diffview_actions.scroll_view(0.25), -- Scroll the view down
            ["<tab>"]     = diffview_actions.select_next_entry,
            ["<s-tab>"]   = diffview_actions.select_prev_entry,
            ["<C-space>"] = diffview_actions.goto_file,
            ["i"]         = diffview_actions.listing_style, -- Toggle between 'list' and 'tree' views
            ["f"]         = diffview_actions.toggle_flatten_dirs, -- Flatten empty subdirectories in tree listing style.
            ["<cr>"]      = false,
        },

        file_history_panel = {
            ["D"]         = diffview_actions.open_in_diffview, -- Open the entry under the cursor in a diffview
            ["y"]         = diffview_actions.copy_hash, -- Copy the commit hash of the entry under the cursor
            ["L"]         = diffview_actions.open_commit_log,
            ["zR"]        = diffview_actions.open_all_folds,
            ["zM"]        = diffview_actions.close_all_folds,
            ["<space>"]   = diffview_actions.select_entry,
            ["<c-u>"]     = diffview_actions.scroll_view(-0.25),
            ["<c-d>"]     = diffview_actions.scroll_view(0.25),
            ["<tab>"]     = diffview_actions.select_next_entry,
            ["<s-tab>"]   = diffview_actions.select_prev_entry,
            ["<C-space>"] = diffview_actions.goto_file,
            ["<cr>"]      = false,
        },
        option_panel = {
            ["<tab>"] = diffview_actions.select_entry,
            ["q"]     = diffview_actions.close,
            ["<cr>"]  = false,
        },
    },
}
