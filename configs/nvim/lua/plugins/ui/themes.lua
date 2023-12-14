return {
    {
        'rebelot/kanagawa.nvim',
        build = ':KanagawaCompile',
        lazy = false,
        priority = 1000,
        opts = {
            compile = true, -- enable compiling the colorscheme
            undercurl = true, -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = false, -- do not set background color
            dimInactive = false, -- dim inactive window `:h hl-NormalNC`
            terminalColors = true, -- define vim.g.terminal_color_{0,17}
            colors = { -- add/modify theme and palette colors
                palette = {},
                theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
            },
            theme = "wave", -- Load "wave" theme when 'background' option is not set
            background = { -- map the value of 'background' option to a theme
                dark = "wave", -- try "dragon" !
                light = "lotus"
            },
        }
    },
    {
        'EdenEast/nightfox.nvim',
        build = ':NightfoxCompile',
        lazy = true,
        opts = {
            options = {
                -- Compiled file's destination location
                compile_path = vim.fn.stdpath("cache") .. "/nightfox",
                compile_file_suffix = "_compiled", -- Compiled file suffix
                transparent = false, -- Disable setting background
                terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                dim_inactive = false, -- Non focused panes set to alternative background
                styles = {
                    comments = "italic",
                    keywords = "bold",
                    types = "italic,bold",

                    strings = "NONE",
                    conditionals = "NONE",
                    constants = "NONE",
                    functions = "NONE",
                    numbers = "NONE",
                    operators = "NONE",
                    variables = "NONE",
                },
                inverse = { -- Inverse highlight for different types
                    match_paren = false,
                    visual = false,
                    search = false,
                },
                modules = { -- List of various plugins and additional options
                    -- ...
                },
            },
            palettes = {},
            specs = {},
            groups = {},
        }
    },
    {
        'rose-pine/neovim',
        lazy = true,
        name = 'rose-pine',
    },
    {
        'folke/tokyonight.nvim',
        lazy = true,
    },
    {
        'catppuccin/nvim',
        name = "catppuccin",
        lazy = true,
    },
}
