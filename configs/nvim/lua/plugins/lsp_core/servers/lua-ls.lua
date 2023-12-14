local conf = require("plugins.lsp_core.servers.conf")

local lua_lsp_on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
        client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
            Lua = {
                runtime = {
                    version = 'LuaJIT'
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                    checkThirdParty = false,
                    library = {
                        vim.env.VIMRUNTIME
                    }
                }
            }
        })

        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
end

require('lspconfig').lua_ls.setup {
    autostart = true,
    handlers = conf.handlers,
    on_attach = conf.on_attach,
    capabilities = conf.capabilities,
    on_init = lua_lsp_on_init,
}

