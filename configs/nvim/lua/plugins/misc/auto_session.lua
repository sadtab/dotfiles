return {
    'rmagatti/auto-session',
    lazy = true,
    cmd = { 'SessionSave', 'SessionRestore' },
    opts = {
        log_level = "error",
        auto_session_enabled = false,
        auto_session_suppress_dirs = true,
        auto_session_create_enabled = false,
        auto_session_allowed_dirs = false,
        auto_session_enable_last_session = false,
        auto_session_use_git_branch = false,
        auto_restore_enabled = false,
        -- cwd_change_handling = {
        --     restore_upcoming_session = false,
        --     pre_cwd_changed_hook = nil,
        --     post_cwd_changed_hook = nil,
        --     -- post_cwd_changed_hook = function()
        --     --     require("lualine").refresh()
        --     -- end,
        -- },
    }
}
