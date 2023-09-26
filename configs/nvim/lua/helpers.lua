local M = {}

M.kind_icons = {
    Text = "󰊄",
    Method = "",
    Function = "",
    Constructor = "󱁤",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

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

return M
