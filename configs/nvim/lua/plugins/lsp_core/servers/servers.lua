local kind_icons = require("helpers").kind_icons
local keys = require("keymaps")

-- Built-in lsp Generic Config
vim.fn.sign_define("DiagnosticSignError",
    { texthl = "DiagnosticSignError", text = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignWarn",
    { texthl = "DiagnosticSignWarn", text = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignHint",
    { texthl = "DiagnosticSignHint", text = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignInfo",
    { texthl = "DiagnosticSignInfo", text = "", numhl = "" })

vim.diagnostic.config({
    virtual_text = false,
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

-- LSP handlers
local handlers = {
    -- ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
    -- ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

-- LSP on_attach
local on_attach = function(client, bufnr)
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    keys.lsp(client, bufnr)
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
            -- hint = { enable = true },
            diagnostics = {
                enable = true,
                globals = { 'vim', 'describe' },
                disable = { "lowercase-global" }
            },
            workspace = {
                checkThirdParty = false,
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

----------------
-----clangd-----
----------------

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
    require("clangd_extensions.inlay_hints")
    -- require("clangd_extensions.inlay_hints").setup_autocmd()
    -- require("clangd_extensions.inlay_hints").disable_inlay_hints() -- set of by defaults

    require("which-key").register({
        ["<space>"] = {
            s = {
                name = "+Switch Header/Source",
            },
        }
    })
    keys.clangd(bufnr)
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
            function() switch_source_header_splitcmd(0, "edit") end,
            description = "Open source/header in current buffer",
        },
        ClangdSwitchSourceHeaderVSplit = {
            function() switch_source_header_splitcmd(0, "vsplit") end,
            description = "Open source/header in a new vsplit",
        },
        ClangdSwitchSourceHeaderSplit = {
            function() switch_source_header_splitcmd(0, "split") end,
            description = "Open source/header in a new split",
        }
    }
}

--------------
--other server
--------------
local servers = { 'cmake', 'vimls', 'bashls', 'jsonls', 'lemminx', 'bufls'  }
for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,
    autostart = true,
  }
end

require('lspconfig').html.setup {
    handlers = handlers,
    on_attach = on_attach,
    capabilities = capabilities,
    autostart = true,
    cmd = { "vscode-html-language-server", "--stdio" }
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
