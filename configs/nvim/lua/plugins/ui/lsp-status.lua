local config = function()
    local lspkind = require('lspkind')
    local lsp_status = require('lsp-status')
    lsp_status.config {
        kind_labels = lspkind.symbol_map,
        show_filename = false,
        spinner_frames = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
        indicator_errors = '🟥',
        indicator_warnings = '🟨',
        indicator_info = '󰙎',
        indicator_hint = '💡',
        indicator_ok = '👌',
        current_function = true,
        diagnostics = false,
        select_symbol = nil,
        update_interval = 100,
        status_symbol = '',
    }
    lsp_status.register_progress()
end

return {
    'nvim-lua/lsp-status.nvim',
    lazy = false,
    config = config,
}
