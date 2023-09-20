-- Lua configs
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

vim.opt.fillchars = {
    fold = " ",
    foldopen = "",
    foldclose = "",
    foldsep = " ",
    diff = "╱",
    eob = " ",
}

-- custom functions
NoteMenu = function()
    require("telescope.builtin").find_files(
        require("telescope.themes").get_dropdown {
            cwd = "~/notes/neorg/",
            hidden = false,
            no_ignore = false,
        })
end

ConfMenu = function()
    require("telescope.builtin").find_files(
        require("telescope.themes").get_dropdown {
            cwd = "~/dotfiles/configs/nvim/"
        })
end

DotMenu = function()
    require("telescope.builtin").find_files(
        require("telescope.themes").get_dropdown {
            cwd = "~/dotfiles/",
            hidden = true,
        })
end
