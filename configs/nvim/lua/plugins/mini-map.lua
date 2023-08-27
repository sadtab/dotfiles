require('mini.map').setup {
    -- Highlight integrations (none by default)
    integrations = {
        require('mini.map').gen_integration.builtin_search(),
        require('mini.map').gen_integration.gitsigns(),
        require('mini.map').gen_integration.diagnostic(),
    },


    -- Symbols used to display data
    symbols = {
        -- Encode symbols. See `:h MiniMap.config` for specification and
        -- `:h MiniMap.gen_encode_symbols` for pre-built ones.
        -- Default: solid blocks with 3x2 resolution.
        encode =require('mini.map').gen_encode_symbols.dot('4x2') ,

        -- Scrollbar parts for view and line. Use empty string to disable any.
        scroll_line = '┃',
        scroll_view = '|',
    },

    -- Window options
    window = {
        -- Whether window is focusable in normal way (with `wincmd` or mouse)
        focusable = false,

        -- Side to stick ('left' or 'right')
        side = 'right',

        -- Whether to show count of multiple integration highlights
        show_integration_count = true,

        -- Total width
        width = 20,

        -- Value of 'winblend' option
        winblend = 100,
    },
}
