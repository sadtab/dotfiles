require('nightfox').setup {
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

-- vim.cmd([[
-- highlight Cursor guifg=white guibg=red
-- highlight iCursor guifg=white guibg=red
-- set guicursor=n-v-c:block-Cursor
-- set guicursor+=i:ver100-iCursor
-- set guicursor+=n-v-c:blinkon0
-- set guicursor+=i:blinkwait10
-- ]])
