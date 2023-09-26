local config = function()
    local cmp = require('cmp')
    local kind_icons = require('helpers').kind_icons
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
        mapping = cmp.mapping.preset.insert({
            ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
            ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),
            ["<C-c>"] = cmp.mapping.abort(),
            ["<C-space>"] = cmp.mapping.confirm({ select = true }),
            ["<tab>"] = cmp.config.disable,
        }),
        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
                -- This concatonates the icons with the name of the item kind
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
            { name = 'nvim_lsp',                group_index = 1 },
            { name = 'neorg',                   group_index = 1 },
            { name = 'nvim_lsp_signature_help', group_index = 1 },
            { name = 'luasnip',                 group_index = 1 },
            { name = 'nvim_lua',                group_index = 1 },
            { name = 'buffer',                  group_index = 2 },
            { name = 'path',                    group_index = 2 },
            { name = 'doxygen',                 group_index = 3 },
        },
        experimental = {
            ghost_text = true
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
        { 'hrsh7th/cmp-nvim-lsp-signature-help' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },
    },
    config = config,
}
