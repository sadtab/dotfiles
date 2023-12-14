return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        routes = {
            -- {
            --     filter = { event = "msg_show", min_length = 20 },
            --     view = "notify",
            -- },
            {
                view = "notify",
                filter = { find = "recording" },
            },
        },
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
            hover = {
                enabled = true,
            },
            signature = {
                enabled = false,
            },
            progress = {
                enabled = true,
            },
            message = {
                enabled = true,
            },
        },
        messages = {
            view_error = "notify", -- view for errors
            view_warn = "notify", -- view for warnings
            view = "notify",
            view_search = 'virtualtext',
        },
        views = {
            cmdline_popup = {
                border = {
                    style = "rounded",
                    padding = { 0, 0 },
                },
                position = {
                    row = -2,
                    col = "50%",
                },
                size = {
                    width = 60,
                    height = "auto",
                },
                win_options = {
                    winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                },
            },
            popupmenu = {
                relative = "editor",
                position = {
                    row = -5,
                    col = "50%",
                },
                size = {
                    width = 60,
                    height = 'auto',
                },
                border = {
                    style = "rounded",
                    padding = { 0, 0 },
                },
                win_options = {
                    winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                },
            },
        },
        presets = {
            bottom_search = false,
            command_palette = false,
            -- long_message_to_split = true,
            inc_rename = true,
            lsp_doc_border = true,
        },

    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
}
