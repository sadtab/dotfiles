return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
    },
    opts = {
        ensure_installed = {
            ----------------------------------
            ----------------LSP---------------
            ----------------------------------
            "cmake",    -- cmake file
            "vimls",    -- vimscript
            "bashls",   -- bash
            "jsonls",   -- JSON
            "lemminx",  -- XML
            "bufls",    -- proto
            "html",     -- html
            "pylsp",    -- python
            "clangd",   -- C/C++
            "lua_ls",   -- lua
            "tsserver", -- js/ts
            "cssls",    -- CSS
            "yamlls",   -- YAML
            -- "denols", -- js/ts
            ----------------------------------
            -------Formatters / Linters-------
            ----------------------------------
            -- "shfmt",
            -- "shellcheck",
            -- "cpplint",
            -- "cmakelint",
            -- "cmakelang", -- cmake https://github.com/williamboman/mason-lspconfig.nvim/issues/307
        },
    },
}
