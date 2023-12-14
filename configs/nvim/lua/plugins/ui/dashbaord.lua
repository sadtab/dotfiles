return {
    'nvimdev/dashboard-nvim',
    lazy = false,
    opts = {
        theme = 'hyper',
        config = {
            week_header = {
                enable = true,
            },
            shortcut = {
                {
                    icon = '󰚰 ',
                    desc = 'Update',
                    group = '@property',
                    action = 'Lazy sync',
                    key = 'u'
                },
                {
                    icon = ' ',
                    desc = 'Files',
                    group = 'Label',
                    action = 'Telescope find_files',
                    key = 'f',
                },
                {
                    icon = ' ',
                    desc = 'Git diff',
                    group = 'DiagnosticHint',
                    action = ':DiffviewOpen',
                    key = 'd',
                },
                {
                    icon = ' ',
                    desc = 'Last Session',
                    group = 'Number',
                    action = 'SessionRestore',
                    key = 's',
                },
                {
                    icon = ' ',
                    desc = 'Config files',
                    group = 'Exception',
                    action = 'lua require("helpers").ConfMenu()',
                    key = 'c',
                },
                {
                    icon = ' ',
                    desc = 'Projects',
                    group = 'DiagnosticError',
                    action = 'Telescope workspaces',
                    key = 'p',
                },
                {
                    icon = ' ',
                    desc = 'Obsidian',
                    group = 'DiagnosticWarn',
                    action = 'ObsidianQuickSwitch',
                    key = 'o',
                },
                {
                    icon = 'ﴬ ',
                    desc = 'Notes',
                    group = 'Function',
                    action = 'lua require("helpers").NoteMenu()',
                    key = 'n',
                },
                {
                    icon = 'ﴬ ',
                    desc = 'Perso Index',
                    group = 'DevIconPackageJson',
                    action = 'Neorg workspace perso',
                    key = 'P',
                },
                {
                    icon = 'ﴬ ',
                    desc = 'Work Index',
                    group = 'DevIconVagrantfile',
                    action = 'Neorg workspace work',
                    key = 'W',
                },
                {
                    icon = 'ﴬ ',
                    desc = 'Journal',
                    group = 'ScrollbarErrorHandle',
                    action = 'lua require("helpers").Journal()',
                    key = 'J',
                },
            },
            confirm_key = '<space>',
            project = {
                enable = true,
                limit = 2,
                icon = '🗃️   ',
                label = '   Recent Projects : ',
                -- action = 'Telescope find_files cwd=',
            },
            mru = {
                limit = 10,
                icon = '📁   ',
                label = '   Most Recent Files :',
            },
            packages = { enable = false },
            footer = { vim.fn.getcwd(), 'Matinale..Midi..Aprèm..Soirée', '6 Tomates' },
        },
    }
}
