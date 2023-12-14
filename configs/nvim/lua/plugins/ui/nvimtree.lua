local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- some of defaults
    vim.keymap.set('n', '[g', api.node.navigate.git.prev, opts('Prev Git'))
    vim.keymap.set('n', ']g', api.node.navigate.git.next, opts('Next Git'))
    vim.keymap.set('n', ']d', api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
    vim.keymap.set('n', '[d', api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))
    vim.keymap.set('n', 'F', api.live_filter.clear, opts('Clean Filter'))
    vim.keymap.set('n', 'f', api.live_filter.start, opts('Filter'))
    vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
    -- vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name')) -- Breaks neoclip
    -- vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path')) -- Breaks neoclip

    -- NERDTree emulation
    vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.set('n', '<space>', api.node.open.no_window_picker, opts('Open: No Window Picker'))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
    vim.keymap.set('n', 'i', api.node.open.horizontal, opts('Open: Horizontal Split'))
    vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split'))
    vim.keymap.set('n', 'cd', api.tree.change_root_to_node, opts('CD'))
    vim.keymap.set('n', 'd', api.node.show_info_popup, opts('Info'))
    vim.keymap.set('n', '<F2>', api.node.run.system, opts('Run System'))
    -- Menu
    vim.keymap.set('n', 'mr', api.fs.rename, opts('Rename'))
    vim.keymap.set('n', 'mc', api.fs.copy.node, opts('Copy'))
    vim.keymap.set('n', 'mm', api.fs.cut, opts('Cut'))
    vim.keymap.set('n', 'md', api.fs.trash, opts('Trash'))
    vim.keymap.set('n', 'ma', api.fs.create, opts('Create'))
    vim.keymap.set('n', 'mp', api.fs.paste, opts('Paste'))
    -- hjkl
    vim.keymap.set('n', 'l', api.node.open.preview, opts('Open Preview'))
    vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
    vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts('Last Sibling'))
    vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts('First Sibling'))
    -- Hidden and ifnored files
    vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
    vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
    vim.keymap.set('n', 'C', api.tree.toggle_git_clean_filter, opts('Toggle Git Clean'))
    vim.keymap.set('n', 'B', api.tree.toggle_no_buffer_filter, opts('Toggle No Buffer'))
    vim.keymap.set('n', 'M', api.marks.toggle, opts('Toggle Bookmark'))
    vim.keymap.set('n', 'p', api.node.open.edit, opts('Open'))
end

return {
    'nvim-tree/nvim-tree.lua',
    lazy = true,
    cmd = { 'NvimTreeToggle' },
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    opts = {
        on_attach = on_attach,
        disable_netrw = true,
        sync_root_with_cwd = true,
        actions = {
            open_file = {
                resize_window = false,
            },
            change_dir = {
                enable = true,
            },
        },
        update_focused_file = {
            enable = true,
            update_root = false,
        },
        hijack_directories = { enable = true },
        hijack_cursor = false,
        hijack_netrw = true,
        auto_reload_on_write = true,
        sort_by = "name",
        view = {
            cursorline = true,
            adaptive_size = false,
            signcolumn = "yes",
            width = 60,
        },
        renderer = {
            highlight_git = false,
            symlink_destination = true,
            group_empty = false,
            highlight_opened_files = "all",
            root_folder_label = ":t:r",
            full_name = true,
            indent_markers = {
                enable = true,
            },
        },
        live_filter = {
            always_show_folders = false
        },
        filters = {
            dotfiles = false,
        },
        diagnostics = {
            enable = true,
            show_on_dirs = false,
        },
    }
}
