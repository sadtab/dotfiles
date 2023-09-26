local config = function()
    require('nvim-treesitter.configs').setup {
        ensure_installed = {
            "c",
            "cpp",
            "lua",
            "vim",
            "bash",
            "cmake",
            "python",
            "json",
            "norg",
            'markdown',
            'markdown_inline',
        },
        sync_install = false,
        ignore_install = { "" },
        highlight = {
            enable = true,
            disable = { "" },                        -- filestypes We want to disable
            additional_vim_regex_highlighting = true -- <= THIS LINE is the magic!
        },
        indent = {
            enable = true,
            disable = { "" }, -- filestypes We want to disable
        },
    }
end

return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        lazy = false,
        config = config,
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        lazy = false,
        opts = {
            enable = true,
        }
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        lazy = false,
    },
}
