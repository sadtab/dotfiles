return {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
        { 'nvim-telescope/telescope.nvim' },
        { 'kkharji/sqlite.lua' },
    },
    config = function()
        local keys = require("keymaps")
        keys.neoclip()
        require("neoclip").setup({
            enable_persistent_history = true,
            continuous_sync = true,
            preview = false,
        })
    end,
}
