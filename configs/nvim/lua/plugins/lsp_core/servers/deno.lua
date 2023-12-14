local conf = require("plugins.lsp_core.servers.conf")

local on_attach_deno = function(client, bufnr)
    conf.on_attach(client, bufnr)
    conf.lsp_status.on_attach(client)
    vim.g.markdown_fenced_languages = {
        "ts=typescript"
    }
end
require('lspconfig').denols.setup {

    handlers = conf.handlers,
    on_attach = on_attach_deno,
    cmd = { "deno", "lsp" },
    cmd_env = {
        NO_COLOR = true
    },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx"
    },
    root_dir = require('lspconfig').util.root_pattern("deno.json", "deno.jsonc", ".git"),
    settings = {
        deno = {
            enable = true,
            suggest = {
                imports = {
                    hosts = {
                        ["https://crux.land"] = true,
                        ["https://deno.land"] = true,
                        ["https://x.nest.land"] = true
                    }
                }
            }
        }
    }
}
