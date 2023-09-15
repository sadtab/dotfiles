--------------------------
---------- CMP -----------
--------------------------

local luasnip = require('luasnip')
require("luasnip.loaders.from_vscode").lazy_load()

local kind_icons = {
    Text = "󰊄",
    Method = "",
    Function = "",
    Constructor = "󱁤",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

local cmp = require('cmp')
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-space>"] = cmp.mapping(
            cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            },
            { "i", "c" }
        ),
        ["<c-y>"] = cmp.mapping {
            i = cmp.mapping.complete(),
            c = function()
                if cmp.visible() then
                    if not cmp.confirm { select = true } then
                        return
                    end
                else
                    cmp.complete()
                end
            end,
        },
        ["<tab>"] = cmp.config.disable,
    }),
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = {
        { name = 'nvim_lsp', group_index = 1 },
        { name = 'neorg', group_index = 1 },
        { name = 'nvim_lsp_signature_help', group_index = 1 },
        { name = 'luasnip', group_index = 1 },
        { name = 'nvim_lua', group_index = 1 },
        { name = 'buffer', group_index = 2 },
        { name = 'path', group_index = 2 },
        { name = 'doxygen', group_index = 3 },
    },
    experimental = {
        ghost_text = true
    },
}

--------------------------
---------- LSP -----------
--------------------------

-- Built-in lsp Generic Config
vim.fn.sign_define("DiagnosticSignError", { texthl = "DiagnosticSignError", text = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignWarn", { texthl = "DiagnosticSignWarn", text = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignHint", { texthl = "DiagnosticSignHint", text = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignInfo", { texthl = "DiagnosticSignInfo", text = "", numhl = "" })

-- Built-in diagnostics Config
vim.diagnostic.config({
    -- disable virtual text
    virtual_text = false,
    -- show signs
    update_in_insert = true,
    signs = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

-- LSP settings (for overriding per client)
local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    vim.keymap.set('n', '<space>d', '<CMD>Lspsaga goto_type_definition<CR>',
        { noremap = true, silent = true, buffer = bufnr, desc = "Goto type definition" })
    vim.keymap.set('n', '<space>d', '<CMD>Lspsaga goto_definition<CR>',
        { noremap = true, silent = true, buffer = bufnr, desc = "Goto definition" })
    vim.keymap.set('n', '<space>a', '<cmd>CodeActionMenu<CR>',
        { noremap = true, silent = true, buffer = bufnr, desc = "Show action" })
    vim.keymap.set('n', '<space>R', '<CMD>Lspsaga rename<CR>',
        { noremap = true, silent = true, buffer = bufnr, desc = "Rename References" })
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end,
        { noremap = true, silent = true, buffer = bufnr, desc = "Format file" })
    vim.keymap.set('n', '<space>h', vim.lsp.buf.signature_help,
        { noremap = true, silent = true, buffer = bufnr, desc = "Signiture Help" })
    vim.keymap.set('n', '<space>k', '<cmd>lua require"goto-preview".goto_preview_definition()<CR>',
        { noremap = true, silent = true, buffer = bufnr, desc = "Floating Definition" })
    vim.keymap.set('n', '<space>K', '<cmd>lua require"goto-preview".close_all_win()<CR>',
        { noremap = true, silent = true, buffer = bufnr, desc = "Floating Definition Close" })
    vim.keymap.set('n', '<space>t', "<cmd>SymbolsOutline<CR>",
        { noremap = true, silent = true, desc = "Symbols Outline" })

    if client.server_capabilities.hoverProvider then
        vim.keymap.set('n', 'K', '<CMD>Lspsaga hover_doc<CR>',
            { noremap = true, silent = true, buffer = bufnr, desc = "Show Hover doc" })
    end

end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- lsp_status config
local lsp_status = require('lsp-status')
lsp_status.config {
    kind_labels = kind_icons,
    current_function = true,
    show_filename = false,
    diagnostics = false,
    indicator_separator = ' ',
    component_separator = ' ',
    indicator_ok = '',
    spinner_frames = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
    status_symbol = '',
    select_symbol = nil,
    update_interval = 100
}
lsp_status.register_progress()

--------------------------
------ LSP servers -------
--------------------------

---------
--sumneko
---------

-- This will be the path towards your sumneko folder. This depends on the installation path
local sumneko_root_path = os.getenv("HOME") .. "/.config/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

require('lspconfig').lua_ls.setup {
    autostart = true,
    handlers = handlers,
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
            completion = { enable = true, callSnippet = "Both" },
            diagnostics = {
                enable = true,
                globals = { 'vim', 'describe' },
                disable = { "lowercase-global" }
            },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
                },
                -- adjust these two values if your performance is not optimal
                maxPreload = 2000,
                preloadFileSize = 1000
            }
        }
    },
}

--[[ require('lspconfig').lua_ls.setup {
    autostart = true,
    handlers = handlers,
    on_attach = on_attach,
    capabilities = capabilities,
    -- cmd = { '~/.local/share/lua-language-server/bin/lua-language-server' },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            completion = { enable = true, callSnippet = "Both" },
            diagnostics = {
                enable = true,
                globals = { 'vim'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        }
    },
} ]]
--------
--clangd
--------

local function switch_source_header_splitcmd(bufnr, splitcmd)
    bufnr = require('lspconfig').util.validate_bufnr(bufnr)
    local clangd_client = require('lspconfig').util.get_active_client_by_name(bufnr, 'clangd')
    local params = { uri = vim.uri_from_bufnr(bufnr) }
    if clangd_client then
        clangd_client.request("textDocument/switchSourceHeader", params, function(err, result)
            if err then
                error(tostring(err))
            end
            if not result then
                print("Corresponding file can’t be determined")
                return
            end
            vim.api.nvim_command(splitcmd .. " " .. vim.uri_to_fname(result))
        end, bufnr)
    else
        print 'textDocument/switchSourceHeader is not supported by the clangd server active on the current buffer'
    end
end

local on_attach_clangd = function(client, bufnr)
    on_attach(client, bufnr)
    lsp_status.on_attach(client)

    require("which-key").register({
        ["<space>"] = {
            s = {
                name = "+Switch Header/Source",
            },
        }
    })
    vim.keymap.set('n', '<space>S', "<cmd>ClangdSwitchSourceHeader<CR>",
        { noremap = true, silent = true, buffer = bufnr, desc = "Switch Header/Source" })
    vim.keymap.set('n', '<space>ss', "<cmd>ClangdSwitchSourceHeaderSplit<CR>",
        { noremap = true, silent = true, buffer = bufnr, desc = "Switch in split" })
    vim.keymap.set('n', '<space>sv', "<cmd>ClangdSwitchSourceHeaderVSplit<CR>",
        { noremap = true, silent = true, buffer = bufnr, desc = "Switch in vsplit" })
end

local handlers_clangd = handlers
handlers_clangd["lsp_status"] = lsp_status.extensions.clangd.setup()

require('lspconfig').clangd.setup {
    handlers = handlers_clangd,
    on_attach = on_attach_clangd,
    capabilities = vim.tbl_extend("keep", capabilities, lsp_status.capabilities),
    cmd = {
        "/home/stabei/clangd/bin/clangd",
        "--compile-commands-dir=build",
        "--background-index",
        "--header-insertion=iwyu",
        "--query-driver=/home/dev/ara/eb/adaptivecore/sdk/eblinux/qemu-x86/2.13.0-20-11/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++"
    },
    single_file_support = true,
    autostart = false,
    init_options = {
        clangdFileStatus = true -- required for lsp_status
    },
    filetypes = { "c", "cpp", "h", "hpp", "objc", "objcpp", "cuda" },
    commands = {
        ClangdSwitchSourceHeader = {
            function() switch_source_header_splitcmd(0, "edit") end;
            description = "Open source/header in current buffer";
        },
        ClangdSwitchSourceHeaderVSplit = {
            function() switch_source_header_splitcmd(0, "vsplit") end;
            description = "Open source/header in a new vsplit";
        },
        ClangdSwitchSourceHeaderSplit = {
            function() switch_source_header_splitcmd(0, "split") end;
            description = "Open source/header in a new split";
        }
    }
}

--------------
--other server
--------------

require('lspconfig').cmake.setup {
    handlers = handlers,
    on_attach = on_attach,
    capabilities = capabilities,
    autostart = true,
}

require('lspconfig').vimls.setup {
    handlers = handlers,
    on_attach = on_attach,
    capabilities = capabilities,
    autostart = true,
}

require('lspconfig').bashls.setup {
    handlers = handlers,
    on_attach = on_attach,
    capabilities = capabilities,
    autostart = true,
}

require('lspconfig').jsonls.setup {
    handlers = handlers,
    on_attach = on_attach,
    capabilities = capabilities,
    autostart = true,
}

require('lspconfig').lemminx.setup {
    handlers = handlers,
    on_attach = on_attach,
    capabilities = capabilities,
    autostart = true,
}

require('lspconfig').html.setup {
    handlers = handlers,
    on_attach = on_attach,
    capabilities = capabilities,
    autostart = true,
    cmd = { "vscode-html-language-server", "--stdio" }
}
require('lspconfig').bufls.setup {
    handlers = handlers,
    on_attach = on_attach,
    capabilities = capabilities,
    autostart = true,
}

require('lspconfig').pylsp.setup {
    handlers = handlers,
    on_attach = on_attach,
    capabilities = capabilities,
    autostart = false,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    enable = false,
                    --ignore = { 'W391' },
                    --maxLineLength = 100
                },
                flake8 = {
                    enable = true,
                    --ignore = { 'W391' },
                    --maxLineLength = 100
                }
            }
        }
    }
}
