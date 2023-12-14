local config = function()
    require('lint').linters_by_ft = {
        markdown = { 'vale' },
        cmake = { 'cmakelint' },
        cpp = { 'cpplint' },
        -- sh = { 'shellcheck' }
    }
    require('lint').linters.cmakelint.args = { "--filter=-linelength" }
end

return {
    'mfussenegger/nvim-lint',
    lazy = false,
    config = config,
}
