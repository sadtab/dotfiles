local get_lsp_name = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return "No LSP"
    end

    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, vim.bo[bufnr].filetype) ~= -1 then
            return client.name
        end
    end
    return "No LSP"
end

local white_space = function()
    local space = vim.fn.search([[\s\+$]], 'nwc')
    return space ~= 0 and "Trailing whitespace" or ""
end

local mixed_indent = function()
    local space_pat = [[\v^ +]]
    local tab_pat = [[\v^\t+]]
    local space_indent = vim.fn.search(space_pat, 'nwc')
    local tab_indent = vim.fn.search(tab_pat, 'nwc')
    local mixed = (space_indent > 0 and tab_indent > 0)
    local mixed_same_line
    if not mixed then
        mixed_same_line = vim.fn.search([[\v^(\t+ | +\t)]], 'nwc')
        mixed = mixed_same_line > 0
    end
    if not mixed
    then
        return ''
    else
        return 'Mixed Indent'
    end
end

return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    opts = {
        options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = '',
            section_separators = '',
            --component_separators = { left = '', right = ''},
            --section_separators = { left = '', right = ''},
            disabled_filetypes = {
                statusline = { 'NvimTree' },
                winbar = { 'NvimTree' },
            },
            ignore_focus = { 'NvimTree' },
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
        },
        sections = {
            lualine_a = {
                'mode'
            },
            lualine_b = {
                'branch',
                'diff'
            },
            lualine_c = {
                'filename',
                'diagnostics',
                'searchcount',
            },
            lualine_x = {
                { white_space,                          color = { fg = 'yellow' } },
                { mixed_indent,                         color = { fg = 'yellow' } },
                { "lua require('lsp-status').status()", color = { fg = 'lightblue' } },
                { 'filetype', }
            },
            lualine_y = {
                'location',
                'progress'
            },
            lualine_z = {
                get_lsp_name,
                {
                    'os.date("%A")',
                    color = {
                        bg = 'red',
                        gui = 'italic,bold'
                    }
                }
            }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { get_lsp_name, 'os.date("%A")' },
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}

    }
}
