return {
    'numToStr/Comment.nvim',
    lazy = true,
    keys = {
        { 'cc', mode = { 'n', 'v' } },
        { 'cb', mode = { 'n', 'v' } },
    },
    opts = {
        ignore = '^$',
        toggler = {
            ---Line-comment toggle keymap
            line = 'cc',
            ---Block-comment toggle keymap
            block = 'cb',
        },
        opleader = {
            ---Line-comment keymap
            line = 'cc',
            ---Block-comment keymap
            block = 'cb',
        }
    }
}
