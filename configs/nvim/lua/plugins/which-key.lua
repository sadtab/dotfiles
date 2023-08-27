require("which-key").setup {
    plugins = {
        presets = {
            operators = false,
            motions = false,
            text_objects = true,
            windows = true,
            nav = false,
            z = true,
            g = true,
        },
    },
    triggers_nowait = {}, -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        n = { "o", "O" },
        i = { "j", "k" },
        v = { "j", "k" },
    },
    require("which-key").register({
        ["<leader>"] = {
            Z        = 'Toggle Lock Scroll',
            ["<CR>"] = '<CR> Literal',
        },
        ["\\"] = {
            f = 'Open .bash_ford',
            t = 'Open .tmux.conf',
            v = 'Open common.vim',
            y = 'Open clangd Yaml config file',
            k = 'Open keymaps.lua',
            S = 'Toggle spelling',
            F = 'Enable spelling (French)',
            E = 'Enable spelling (English)',
            s = 'Autocorrect next spell',
            w = 'Remove trailing whitespaces',
        },
        ["<space>"] = {
            u = 'Open Undotree',
            --["<space>"] = 'Dot command',
            n = {
                name        = "+Neorg",
                n           = 'New norg file',
                t           = 'ToC',
            },
            G = {
                name = "+GitSign",
            },
            e = {
                name = "+Octo",
                i    = {
                    name = "+Issue",
                },
                r    = {
                    name = "+Reaction",
                },
                c    = {
                    name = "+Comment",
                },
                p    = {
                    name = "+PR",
                },
                a    = {
                    name = "+Assignee",
                },
                l    = {
                    name = "+Lable",
                },
                d    = {
                    name = "+Diff Review",
                },
                f    = {
                    name = "+File Panel",
                },
            }
        },
    })
}
