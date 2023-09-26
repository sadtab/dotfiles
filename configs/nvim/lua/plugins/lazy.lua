-- Bootstraping
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = ";" -- Make sure to set `mapleader` before lazy so your mappings are correct

require('lazy').setup({
    -- specs
        { import = "plugins.vimscripts" },
        { import = "plugins.ui" },
        { import = "plugins.lsp_ui" },
        { import = "plugins.lsp_core" },
        { import = "plugins.tools" },
        { import = "plugins.notebook" },
        { import = "plugins.git" },
        { import = "plugins.misc" },
    },
    -- lazy configs
    {
        lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json"
    }
)
