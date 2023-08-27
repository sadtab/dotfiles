require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.summary"] = {
            config = {
                strategy = "default",
            }
        },
        ["core.journal"] = {
            config = {
                journal_folder = ".journal",
                strategy = "flat",
            }
        },
        ["core.concealer"] = {
            config = {
                folds = true,
                icon_preset = "diamond",
            }
        },
        ["core.highlights"] = {},
        ["core.promo"] = {},
        ["core.itero"] = {},
        ["core.integrations.treesitter"] = {},
        ["core.esupports.metagen"] = {},
        ["core.integrations.telescope"] = {},
        ["core.integrations.nvim-cmp"] = {},
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp",
                name = "[Neorg]"
            }
        },
        ["core.dirman"] = {
            config = {
                autochdir = false,
                autochdetect = true,
                workspaces = {
                    work = "~/notes/neorg/work",
                    perso = "~/notes/neorg/perso",
                },
                default_workspace = "work",
            },
        },
        ["core.keybinds"] = {
            config = {
                default_keybinds = false,
                hook = function(keybinds)
                    keybinds.map("norg", "n", "<CR>", ":")
                    keybinds.remap_event("norg", "n", "<C-]>",      "core.esupports.hop.hop-link")
                    keybinds.remap_event("norg", "n", "<C-space>",  "core.qol.todo_items.todo.task_cycle")
                    keybinds.remap_event("norg", "n", "<space>nn",  "core.dirman.new.note")
                    keybinds.remap_event("norg", "i", "<M-CR>",     "core.itero.next-iteration")
                    keybinds.remap_event("norg", "n", "<M-CR>",     "core.itero.next-iteration")
                    keybinds.remap_event("norg", "n", "<lt>",       "core.promo.demote")
                    keybinds.remap_event("norg", "n", ">",          "core.promo.promote")
                    keybinds.remap_event("norg", "v", "<lt>",       "core.promo.demote")
                    keybinds.remap_event("norg", "v", ">",          "core.promo.promote")
                    keybinds.remap("norg", "n", "<space>nt",        "<cmd>Neorg toc split<CR>")
                    keybinds.remap("norg", "n", "<C-c>",            "<cmd>Neorg toggle-concealer<CR>")
                end,
            }
        },
    }
}
