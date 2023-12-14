local lsp_status = require('lsp-status')
local conf = require("plugins.lsp_core.servers.conf")

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
        print 'textDocument/switchSourceHeader is not supported by the clangd server'
    end
end

local on_attach_clangd = function(client, bufnr)
    conf.on_attach(client, bufnr)
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
    require("keymaps").clangd(bufnr)
end

local handlers_clangd = conf.handlers
handlers_clangd["lsp_status"] = lsp_status.extensions.clangd.setup

require('lspconfig').clangd.setup {
    handlers = handlers_clangd,
    on_attach = on_attach_clangd,
    capabilities = vim.tbl_extend("keep", conf.capabilities, lsp_status.capabilities),
    cmd = {
        "clangd",
        "--compile-commands-dir=build",
        "--background-index",
        "--header-insertion=iwyu",
        "--query-driver=/home/dev/ara/eb/adaptivecore/sdk/eblinux/qemu-x86/2.14.0-20-11/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++"
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
