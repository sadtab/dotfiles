local config = function()
    local illuminated = require('illuminate')
    local keys = require('keymaps')

    -- default configuration
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { reverse = true })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { reverse = true })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { reverse = true })

    illuminated.configure({
        providers = {
            'lsp',
            'treesitter',
            'regex',
        },
        delay = 0,
        filetypes_denylist = {
            "NvimTree",
            "fugitive",
            "NeogitStatus",
            "DiffviewFiles",
        },
        under_cursor = false,
    })
    keys.illuminate(illuminated)

    -- when loaded start it right away
    require('illuminate').toggle()
end

return {
    'RRethy/vim-illuminate',
    lazy = true,
    cmd = { 'IlluminateToggle' },
    config = config
}
