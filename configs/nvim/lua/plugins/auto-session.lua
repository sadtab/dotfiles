require("auto-session").setup {
    log_level = "error",
    auto_session_enable_last_session = false,
    auto_session_use_git_branch = true,
    auto_restore_enabled = false,
    cwd_change_handling = {
        restore_upcoming_session = true,
        pre_cwd_changed_hook = nil,
        post_cwd_changed_hook = function()
            require("lualine").refresh()
        end,
    },
}
