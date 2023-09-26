require("plugins.lazy")
vim.cmd("source ~/.config/nvim/nvim.vim")
vim.cmd("source ~/.config/nvim/common.vim")
require("config")
require("keymaps")
if vim.g.neovide then
    require("neovide")
end
