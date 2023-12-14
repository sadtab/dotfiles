local M = {}

M.NoteMenu = function()
    require("neorg")
    require("telescope.builtin").find_files(
        require("telescope.themes").get_dropdown {
            cwd = "~/notes/neorg/",
            hidden = false,
            no_ignore = false,
        })
end

M.ConfMenu = function()
    require("telescope.builtin").find_files(
        require("telescope.themes").get_dropdown {
            cwd = "~/dotfiles/configs/nvim/"
        })
end

M.DotMenu = function()
    require("telescope.builtin").find_files(
        require("telescope.themes").get_dropdown {
            cwd = "~/dotfiles/",
            hidden = true,
        })
end

M.Journal = function()
    require("neorg")
    vim.cmd("Neorg journal today")
end

M.load_themes = function()
    vim.cmd([[
        Lazy load tokyonight.nvim
        Lazy load rose-pine
        Lazy load catppuccin
        Lazy load nightfox.nvim
    ]])
    require("telescope.builtin").colorscheme(require("telescope.themes").get_dropdown())
end

return M
