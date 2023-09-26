vim.keymap.set("n", "<C-]>", function()
    if require("obsidian").util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
    end
end, { noremap = false, expr = true })

return {
    'epwalsh/obsidian.nvim',
    lazy = true,
    cmd = { 'ObsidianQuickSwitch' },
    dependencies = {
        "hrsh7th/nvim-cmp",
        "preservim/vim-markdown",
    },
    opts = {
        dir = "~/notes/obsVault/", -- no need to call 'vim.fn.expand' here

        -- Optional, completion.
        completion = {
            nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
        },

        -- Optional, set to true if you don't want Obsidian to manage frontmatter.
        disable_frontmatter = true,

        -- Optional, customize how names/IDs for new notes are created.
        note_id_func = function(title)
            -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
            -- In this case a note with the title 'My new note' will given an ID that looks
            -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
            local suffix = ""
            if title ~= nil then
                -- If title is given, transform it into valid file name.
                suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
                -- If title is nil, just add 4 random uppercase letters to the suffix.
                for _ = 1, 4 do
                    suffix = suffix .. string.char(math.random(65, 90))
                end
            end
            return suffix
        end,

        -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
        follow_url_func = function(url)
            vim.fn.jobstart({ "xdg-open", url }) -- linux
        end,

        -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
        open_app_foreground = false,
        mappings = {},

    }
}
