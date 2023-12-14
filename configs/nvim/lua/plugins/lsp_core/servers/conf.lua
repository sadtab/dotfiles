local keys = require("keymaps")
local lsp_status = require('lsp-status')

-- LSP handlers
local handlers = {
    -- These are overridden with noice
    -- ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
    -- ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

-- LSP on_attach
local on_attach = function(client, bufnr)
    keys.lsp(client, bufnr)
    lsp_status.on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local M = {
    handlers = handlers,
    capabilities = capabilities,
    on_attach = on_attach,
}
return M
