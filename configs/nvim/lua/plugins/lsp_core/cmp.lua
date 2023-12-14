local config = function()
    local cmp = require('cmp')
    local keys = require('keymaps')
    local lspkind = require('lspkind')
    cmp.setup {
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        window = {
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
        },
        mapping = cmp.mapping.preset.insert(keys.auto_complete(cmp)),
        formatting = {
            format = lspkind.cmp_format({
                mode = 'symbol_text',
                maxwidth = 50,
                ellipsis_char = '...',
            })
        },
        sources = cmp.config.sources({
            { name = 'luasnip',  group_index = 1, keyword_length = 2 },
            { name = 'nvim_lsp', group_index = 1, keyword_length = 2 },
            { name = 'neorg',    group_index = 1, keyword_length = 2 },
            { name = 'nvim_lua', group_index = 1, keyword_length = 2 },
            { name = 'buffer',   group_index = 2, keyword_length = 2 },
            { name = 'path',     group_index = 2, keyword_length = 2 },
            { name = 'doxygen',  group_index = 3, keyword_length = 2 },
        }),
        experimental = {
            ghost_text = true
        },
        sorting = {
            comparators = {
                cmp.config.compare.offset,
                cmp.config.compare.exact,
                cmp.config.compare.recently_used,
                require("clangd_extensions.cmp_scores"),
                cmp.config.compare.kind,
                cmp.config.compare.sort_text,
                cmp.config.compare.length,
                cmp.config.compare.order,
            },
        },
    }
end

return {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = "InsertEnter",
    dependencies = {
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },
        { 'L3MON4D3/LuaSnip' },
    },
    config = config,
}
