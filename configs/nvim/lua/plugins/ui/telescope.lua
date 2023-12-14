local config = function()
    local telescope = require('telescope')
    telescope.setup {
        defaults = {
            mappings = { -- extend mappings
                i = {
                    ["<Down>"] = require('telescope.actions').cycle_history_next,
                    ["<Up>"] = require('telescope.actions').cycle_history_prev,
                    ["<C-space>"] = require("trouble.providers.telescope").open_with_trouble,
                    ["kj"] = "close",
                    ["jj"] = "close",
                    ["kk"] = "close",
                    ["jk"] = "close",
                },
                n = {
                    ["<Down>"] = require('telescope.actions').cycle_history_next,
                    ["<Up>"] = require('telescope.actions').cycle_history_prev,
                    ["<C-space>"] = require("trouble.providers.telescope").open_with_trouble,
                    ["kj"] = "close",
                    ["jj"] = "close",
                    ["kk"] = "close",
                    ["jk"] = "close",
                },
            },
            history = {
                path = '~/.local/share/nvim/databases/telescope_history',
                limit = 10000,
            },
            center = {
                height = 0.4,
                preview_cutoff = 120,
                prompt_position = "top",
                width = 0.8
            },

        },
        pickers = {
            current_buffer_fuzzy_find = {
                theme = "dropdown",
            },
            live_grep = {},
        },
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            },
            file_browser = {
                theme = "ivy",
                -- disables netrw and use telescope-file-browser in its place
                hijack_netrw = true,
                mappings = {
                    ["i"] = {
                        -- your custom insert mode mappings
                    },
                    ["n"] = {
                        -- your custom normal mode mappings
                    },
                },
            },
            live_grep_args = {
                auto_quoting = true, -- enable/disable auto-quoting
                -- define mappings, e.g.
                mappings = { -- extend mappings
                    i = {
                        -- ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
                        -- ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }),
                    },
                },
            }
        }
    }

    telescope.load_extension('fzf')
    telescope.load_extension('live_grep_args')
    telescope.load_extension("workspaces")
    telescope.load_extension("noice")
end

return {
    {
        'nvim-telescope/telescope.nvim',
        lazy = false,
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            { 'nvim-telescope/telescope-live-grep-args.nvim' },
        },
        config = config
    },
}
