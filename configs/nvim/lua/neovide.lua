-- Neovide experimentals
-- Shift Insert to paste
vim.keymap.set({ 'c', 'i' }, '<S-Insert>', '<C-R>+',
    { noremap = true, silent = true })
-- tmux style pane splits
vim.keymap.set({ 't', 'i', 'n' }, '<M-->', '<cmd>new | terminal<CR>',
    { noremap = true, silent = true })
vim.keymap.set({ 't', 'i', 'n' }, '<M-\\>', '<cmd>vnew | terminal<CR>',
    { noremap = true, silent = true })
-- tmux style tab navigation and creation
vim.keymap.set({ 't', 'i', 'n' }, '<M-.>', '<cmd>tabnext<CR>',
    { noremap = true, silent = true })
vim.keymap.set({ 't', 'i', 'n' }, '<M-,>', '<cmd>tabprevious<CR>',
    { noremap = true, silent = true })
vim.keymap.set({ 't', 'i', 'n' }, '<M-c>', '<cmd>tabnew | terminal<CR>',
    { noremap = true, silent = true })

vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_refresh_rate = 140
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_fullscreen = true
vim.g.neovide_cursor_animation_length = 0.1
vim.g.neovide_cursor_trail_size = 0.2
vim.g.neovide_cursor_animate_command_line = false
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_scroll_animation_length = 1
vim.g.neovide_confirm_quit = true
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.o.guifont = "Cousine Nerd Font Mono Regular:h12"


-- font resize as tty terminal
local function neovideScale(amount)
    local temp = vim.g.neovide_scale_factor + amount

    if temp < 0.3 then
        return
    end

    vim.g.neovide_scale_factor = temp
end

vim.keymap.set("n", "<C-+>", function()
    neovideScale(0.1)
end)

vim.keymap.set("n", "<C-->", function()
    neovideScale(-0.1)
end)
