return {
    'iamcco/markdown-preview.nvim',
    ft = { 'pu', 'md' },
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
    config = true,
}
