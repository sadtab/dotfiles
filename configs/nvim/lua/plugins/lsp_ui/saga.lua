return {
    'glepnir/lspsaga.nvim',
    lazy = true,
    event = "LspAttach",
    cmd = "Lspsaga",
    opts = {
        symbol_in_winbar = {
            enable = false,
            separator = " ",
            ignore_patterns = {},
            hide_keyword = true,
            show_file = true,
            folder_level = 2,
            respect_root = false,
            color_mode = true,
        },
        lightbulb = {
            enable = false,
        },
    }
}
