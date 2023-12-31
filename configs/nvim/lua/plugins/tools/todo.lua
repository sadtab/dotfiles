return {
    'folke/todo-comments.nvim',
    lazy = false,
    opts = {
        signs = true,      -- show icons in the signs column
        sign_priority = 8, -- sign priority
        -- keywords recognized as todo comments
        keywords = {
            TODOST = { icon = "", color = "green" }
        },
        gui_style = {
            fg = "NONE",        -- The gui style to use for the fg highlight group.
            bg = "BOLD",        -- The gui style to use for the bg highlight group.
        },
        merge_keywords = false, -- when true, custom keywords will be merged with the defaults
        -- highlighting of the line containing the todo comment
        -- * before: highlights before the keyword (typically comment characters)
        -- * keyword: highlights of the keyword
        -- * after: highlights after the keyword (todo text)
        highlight = {
            multiline = false,        -- enable multine todo comments
            multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
            multiline_context = 10,   -- extra lines that will be re-evaluated when changing a line
            before = "",              -- "fg" or "bg" or empty
            keyword = "bg",           -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
            after = "",               -- "fg" or "bg" or empty
            pattern = [[(KEYWORDS)]], -- pattern or table of patterns, used for highlightng (vim regex)
            comments_only = false,    -- uses treesitter to match keywords in comments only
            max_line_len = 400,       -- ignore lines longer than this
            exclude = {},             -- list of file types to exclude highlighting
        },
        -- list of named colors where we try to extract the guifg from the
        -- list of highlight groups or use the hex color if hl not found as a fallback
        colors = {
            error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
            warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
            info = { "DiagnosticInfo", "#2563EB" },
            hint = { "DiagnosticHint", "#10B981" },
            default = { "Identifier", "#7C3AED" },
            test = { "Identifier", "#FF00FF" },
            green = { "#10B981" }
        },
        search = {
            command = "rg",
            args = {
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
            },
            pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
        },
    }
}
