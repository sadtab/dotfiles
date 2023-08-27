-- packer
require("plugins.packer")

-- Config
vim.cmd("source ~/.config/nvim/nvim.vim")
vim.cmd("source ~/.config/nvim/common.vim")

-- Plugins with config
require("plugins.lsp")
require("plugins.nvim-tree")
require("plugins.which-key")
require("plugins.gitsigns")
require("plugins.nightfox")
require("plugins.octo")
require("plugins.diffview")
require("plugins.nvim-treesitter")
require("plugins.goto-preview")
require("plugins.lua-line")
require("plugins.comment")
require("plugins.todo")
require("plugins.dashbaord")
require("plugins.telescope")
require("plugins.mini-map")
require("plugins.illuminated")
require("plugins.neorg")
require("plugins.auto-session")
require("plugins.twilight")
require("plugins.outline")
require("plugins.saga")
require("plugins.neogit")
require("plugins.obsidian")

-- Plugins without config
require("nvim-web-devicons").setup {}
require("fidget").setup {}
require("neoscroll").setup {}
require("treesitter-context").setup {}
require("neodev").setup {}
require("scrollbar").setup {}
require("nvim-autopairs").setup {}
require('neogen').setup {}
require('cellular-automaton')
require("icon-picker").setup({
    disable_legacy_commands = true
})

require("keymaps")


-- Archive
-- require("tidy").setup()
-- require("neogit").setup {}
