local config = function()
    require("formatter").setup {
        logging = true,
        log_level = vim.log.levels.WARN,
        filetype = {
            lua = {
                require("formatter.filetypes.lua").stylua,
            },
            cmake = {
                require("formatter.filetypes.cmake").cmakeformat,
            },
            sh = {
                require("formatter.filetypes.cmake").shfmt,
            },
            css = {
                require("formatter.filetypes.css").prettier,
            },
            yaml = {
                require("formatter.filetypes.yaml").prettier,
            },
            html = {
                require("formatter.filetypes.html").prettier,
            },
            cpp = {
                require("formatter.filetypes.cpp").clangformat,
            },
            ["*"] = {
                require("formatter.filetypes.any").remove_trailing_whitespace
            }
        }
    }
end

return {
    'mhartington/formatter.nvim',
    lazy = false,
    config = config,
}
