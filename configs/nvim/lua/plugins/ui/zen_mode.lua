return {
    "folke/zen-mode.nvim",
    lazy = true;
    cmd = 'ZenMode',
    opts = {
        window = {
            backdrop = 0.80,
            width = 130,
            height = 1,
        },
        plugins = {
            twilight = { enabled = true },
            gitsigns = { enabled = true },
            tmux = { enabled = false },
            kitty = {
                enabled = true,
                font = "+4", -- font size increment
            },
            alacritty = {
                enabled = true,
                font = "18", -- font size
            },
        },
    }
}
