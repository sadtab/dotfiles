local config = function()
    local wk = require("which-key")

    wk.setup {
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
    }

    wk.register({
        ["<leader>"] = {
            Z        = 'Toggle Lock Scroll',
            T        = 'New tab',
            ["<CR>"] = '<CR> Literal',
        },
        ["\\"] = {
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
                name = "+Neorg",
                n    = 'New norg file',
                t    = 'ToC',
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
end

return {
    'folke/which-key.nvim',
    lazy = false,
    config = config,
}
