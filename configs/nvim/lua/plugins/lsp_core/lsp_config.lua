return {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
        'nvim-lua/lsp-status.nvim',
    },
    config = function()
        require("plugins.lsp_core.servers.servers")
        require("plugins.lsp_core.servers.lua-ls")
        require("plugins.lsp_core.servers.clang")
    end
}
