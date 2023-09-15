require('packer').startup({
    function(use)
        use { 'wbthomason/packer.nvim' }

        -------------------
        ---- Vim script ---
        -------------------

        use { 'tpope/vim-surround' }
        use { 'tpope/vim-repeat' }
        use { 'tpope/vim-sensible' }
        use { 'tpope/vim-fugitive' }
        use { 'ingmarlehmann/vim-franca-highlight' } -- , ft = { 'fidl' } }
        use { 'rbong/vim-flog' } -- cmd = { 'Flog', 'Floggit', 'Flogsplit' } }
        use { 'powerman/vim-plugin-AnsiEsc', cmd = { 'AnsiEsc' } }
        use { 'christoomey/vim-tmux-navigator' }
        use { 'mbbill/undotree' }
        use { 'will133/vim-dirdiff' }
        use { 'vim-scripts/DoxygenToolkit.vim' }
        use { 'aklt/plantuml-syntax' }

        ------------
        ---- Lua ---
        ------------

        -- UI
        use { 'nvimdev/dashboard-nvim', }
        use { 'karb94/neoscroll.nvim' }
        use { 'j-hui/fidget.nvim', tag = "legacy" }
        use { 'folke/twilight.nvim' }
        use { 'folke/tokyonight.nvim' }
        use { 'EdenEast/nightfox.nvim', run = ':NightfoxCompile' }
        use { 'catppuccin/nvim', as = "catppuccin" }
        use { 'nvim-lualine/lualine.nvim' }
        use { 'RRethy/vim-illuminate' }
        use { 'petertriho/nvim-scrollbar' }
        use { 'echasnovski/mini.nvim', branch = 'stable' }
        use { 'rmagatti/auto-session' }
        use { 'rose-pine/neovim', as = 'rose-pine' }
        use { 'rebelot/kanagawa.nvim', run = ':KanagawaCompile' }

        -- LSP Core
        use { 'neovim/nvim-lspconfig' }
        use { 'nvim-lua/lsp-status.nvim' }
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        use { 'nvim-treesitter/nvim-treesitter-context' }
        use { 'nvim-treesitter/nvim-treesitter-textobjects' }

        -- LSP Helper
        use { 'weilbith/nvim-code-action-menu' }
        use { 'simrat39/symbols-outline.nvim' }
        use { 'rmagatti/goto-preview' }
        use { 'glepnir/lspsaga.nvim' }

        -- CMP sources
        use { 'hrsh7th/nvim-cmp' }
        use { 'hrsh7th/cmp-path' }
        use { 'hrsh7th/cmp-buffer' }
        use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
        use { 'hrsh7th/cmp-nvim-lsp' }
        use { 'hrsh7th/cmp-nvim-lua' }
        -- use { 'paopaol/cmp-doxygen' }

        -- Snip
        use { 'L3MON4D3/LuaSnip' }
        use { 'saadparwaiz1/cmp_luasnip' }

        -- Utils
        use { 'numToStr/Comment.nvim' }
        use { 'folke/which-key.nvim' }
        use { 'folke/todo-comments.nvim' }
        use { 'nvim-tree/nvim-tree.lua' }
        use { 'danymat/neogen' }
        use { 'gennaro-tedesco/nvim-peekup' }
        use { 'windwp/nvim-autopairs' }
        use { 'nvim-neorg/neorg',
            requires = {
                'nvim-neorg/neorg-telescope',
            },
            run = ':Neorg sync-parsers'
        }
        use { 'epwalsh/obsidian.nvim',

            requires = {
                "hrsh7th/nvim-cmp",
                "preservim/vim-markdown",
            },
        }
        use { 'iamcco/markdown-preview.nvim',
            run = function()
                vim.fn["mkdp#util#install"]()
            end,
        }
        use { 'stevearc/dressing.nvim' }
        use { 'ziontee113/icon-picker.nvim' }

        -- Dependencies
        use { 'nvim-lua/plenary.nvim' }
        use { 'nvim-tree/nvim-web-devicons' }

        -- Nvim
        use { 'folke/neodev.nvim' }

        -- Git
        use { 'lewis6991/gitsigns.nvim' }
        use { 'sindrets/diffview.nvim' }
        use { 'TimUntersberger/neogit',
            requires = {
                'sindrets/diffview.nvim'
            }
        }
        use { 'pwntester/octo.nvim' }
        use { 'natecraddock/workspaces.nvim' }

        -- Telescope
        use { 'nvim-telescope/telescope.nvim' }
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        use { 'nvim-telescope/telescope-file-browser.nvim' }
        use { 'nvim-telescope/telescope-live-grep-args.nvim' }

        -- Just because they exist
        use { 'eandrju/cellular-automaton.nvim' }

        -- LSP

        -- Archive
        -- use { 'rhysd/vim-clang-format' }
        -- use { 'itchyny/screensaver.vim' }
        -- use { 'jose-elias-alvarez/null-ls.nvim' }
        -- use { 'mfussenegger/nvim-lint' }
        -- use { 'mcauley-penney/tidy.nvim' }
        -- use { 'tpope/vim-obsession', cmd = { 'Obsession' } }
        -- use { 'tpope/vim-dispatch', cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }
        -- Lazy loading example
        -- use { 'folke/todo-comments.nvim',
        --     requires = 'nvim-lua/plenary.nvim',
        --     event = 'VimEnter',
        --     config = function()
        --         require("plugins.todo")
        --     end
        -- }

    end,
    config = {
        compile_path = "~/.local/state/nvim/packer_compiled.lua",
    }
})
