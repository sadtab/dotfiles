local conf = require("plugins.lsp_core.servers.conf")

require("lspconfig").tsserver.setup({

    handlers = conf.handlers,
    on_attach = conf.on_attach,
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
    },
    init_options = {
        hostInfo = "neovim"
    },
    single_file_support = true,
    root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
})
