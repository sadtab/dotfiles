return {
    "L3MON4D3/LuaSnip",
    lazy = false,
    version = "2.*",
    build = "make install_jsregexp",
    config = function()
        local luasnip = require('luasnip')
        require("keymaps").snip(luasnip)
    end
}
