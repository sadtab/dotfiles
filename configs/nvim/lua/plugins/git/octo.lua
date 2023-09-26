return {
    'pwntester/octo.nvim',
    lazy = true,
    cmd = { 'Octo' },
    opts = {
        default_remote = { "upstream", "origin" }, -- order to try remotes
        ssh_aliases = {}, -- SSH aliases. e.g. `ssh_aliases = {["github.com-work"] = "github.com"}`
        reaction_viewer_hint_icon = "", -- marker for user reactions
        user_icon = " ", -- user icon
        timeline_marker = "", -- timeline marker
        timeline_indent = "2", -- timeline indentation
        right_bubble_delimiter = "", -- Bubble delimiter
        left_bubble_delimiter = "", -- Bubble delimiter
        github_hostname = "github.ford.com", -- GitHub Enterprise host
        --github_hostname = ""; -- GitHub Enterprise host
        snippet_context_lines = 4, -- number or lines around commented lines
        file_panel = {
            size = 10, -- changed files panel rows
            use_icons = true -- use web-devicons in file panel (if false, nvim-web-devicons does not need to be installed)
        },
        mappings = {
            issue = {
                close_issue = { lhs = "<space>eic", desc = "close issue" },
                reopen_issue = { lhs = "<space>eio", desc = "reopen issue" },
                list_issues = { lhs = "<space>eiL", desc = "list open issues on same repo" },
                reload = { lhs = "<space>eir", desc = "reload issue" },
                open_in_browser = { lhs = "<space>eB", desc = "open issue in browser" },
                copy_url = { lhs = "<space>ey", desc = "Yank URL to system clipboard" },
                add_assignee = { lhs = "<space>eaa", desc = "add assignee" },
                remove_assignee = { lhs = "<space>ear", desc = "remove assignee" },
                create_label = { lhs = "<space>elc", desc = "create label" },
                add_label = { lhs = "<space>ela", desc = "add label" },
                remove_label = { lhs = "<space>elr", desc = "remove label" },
                goto_issue = { lhs = "<space>eL", desc = "navigate to a local repo issue" },
                add_comment = { lhs = "<space>eca", desc = "add comment" },
                delete_comment = { lhs = "<space>ecd", desc = "delete comment" },
                next_comment = { lhs = "]c", desc = "go to next comment" },
                prev_comment = { lhs = "[c", desc = "go to previous comment" },
                react_hooray = { lhs = "<space>erp", desc = "add/remove 🎉 reaction" },
                react_heart = { lhs = "<space>erh", desc = "add/remove ❤️ reaction" },
                react_eyes = { lhs = "<space>ere", desc = "add/remove 👀 reaction" },
                react_thumbs_up = { lhs = "<space>er+", desc = "add/remove 👍 reaction" },
                react_thumbs_down = { lhs = "<space>er-", desc = "add/remove 👎 reaction" },
                react_rocket = { lhs = "<space>err", desc = "add/remove 🚀 reaction" },
                react_laugh = { lhs = "<space>erl", desc = "add/remove 😄 reaction" },
                react_confused = { lhs = "<space>erc", desc = "add/remove 😕 reaction" },
            },
            pull_request = {
                checkout_pr = { lhs = "<space>epc", desc = "checkout PR" },
                merge_pr = { lhs = "<space>epm", desc = "merge commit PR" },
                squash_and_merge_pr = { lhs = "<space>eps", desc = "squash and merge PR" },
                list_commits = { lhs = "<space>epl", desc = "list PR commits" },
                list_changed_files = { lhs = "<space>epD", desc = "list PR changed files" },
                show_pr_diff = { lhs = "<space>epd", desc = "show PR diff" },
                add_reviewer = { lhs = "<space>epv", desc = "add reviewer" },
                remove_reviewer = { lhs = "<space>epV", desc = "remove reviewer request" },
                close_issue = { lhs = "<space>epC", desc = "close PR" },
                reopen_issue = { lhs = "<space>epO", desc = "reopen PR" },
                list_issues = { lhs = "<space>epL", desc = "list open issues on same repo" },
                reload = { lhs = "<space>epR", desc = "reload PR" },
                goto_file = { lhs = "<space>ef", desc = "go to file (Only in PR pane)" },
                open_in_browser = { lhs = "<space>eB", desc = "open PR in browser" },
                copy_url = { lhs = "<space>ey", desc = "copy url to system clipboard" },
                add_assignee = { lhs = "<space>eaa", desc = "add assignee" },
                remove_assignee = { lhs = "<space>ear", desc = "remove assignee" },
                create_label = { lhs = "<space>elc", desc = "create label" },
                add_label = { lhs = "<space>ela", desc = "add label" },
                remove_label = { lhs = "<space>elr", desc = "remove label" },
                goto_issue = { lhs = "<space>eL", desc = "navigate to a local repo issue" },
                add_comment = { lhs = "<space>eca", desc = "add comment" },
                delete_comment = { lhs = "<space>ecd", desc = "delete comment" },
                next_comment = { lhs = "]c", desc = "go to next comment" },
                prev_comment = { lhs = "[c", desc = "go to previous comment" },
                react_hooray = { lhs = "<space>erp", desc = "add/remove 🎉 reaction" },
                react_heart = { lhs = "<space>erh", desc = "add/remove ❤️ reaction" },
                react_eyes = { lhs = "<space>ere", desc = "add/remove 👀 reaction" },
                react_thumbs_up = { lhs = "<space>er+", desc = "add/remove 👍 reaction" },
                react_thumbs_down = { lhs = "<space>er-", desc = "add/remove 👎 reaction" },
                react_rocket = { lhs = "<space>err", desc = "add/remove 🚀 reaction" },
                react_laugh = { lhs = "<space>erl", desc = "add/remove 😄 reaction" },
                react_confused = { lhs = "<space>erc", desc = "add/remove 😕 reaction" },
            },
            review_thread = {
                add_suggestion = { lhs = "<space>ecs", desc = "add suggestion" },
                select_next_entry = { lhs = "]t", desc = "move to previous changed file" },
                select_prev_entry = { lhs = "[t", desc = "move to next changed file" },
                close_review_tab = { lhs = "<space>eC", desc = "close review tab" },
                goto_issue = { lhs = "<space>eL", desc = "navigate to a local repo issue" },
                add_comment = { lhs = "<space>eca", desc = "add comment" },
                delete_comment = { lhs = "<space>ecd", desc = "delete comment" },
                next_comment = { lhs = "]c", desc = "go to next comment" },
                prev_comment = { lhs = "[c", desc = "go to previous comment" },
                react_hooray = { lhs = "<space>erp", desc = "add/remove 🎉 reaction" },
                react_heart = { lhs = "<space>erh", desc = "add/remove ❤️ reaction" },
                react_eyes = { lhs = "<space>ere", desc = "add/remove 👀 reaction" },
                react_thumbs_up = { lhs = "<space>er+", desc = "add/remove 👍 reaction" },
                react_thumbs_down = { lhs = "<space>er-", desc = "add/remove 👎 reaction" },
                react_rocket = { lhs = "<space>err", desc = "add/remove 🚀 reaction" },
                react_laugh = { lhs = "<space>erl", desc = "add/remove 😄 reaction" },
                react_confused = { lhs = "<space>erc", desc = "add/remove 😕 reaction" },
            },
            submit_win = {
                approve_review = { lhs = "<C-a>", desc = "approve review" },
                comment_review = { lhs = "<C-m>", desc = "comment review" },
                request_changes = { lhs = "<C-r>", desc = "request changes review" },
                close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
            },
            review_diff = {
                add_review_comment = { lhs = "<space>eca", desc = "add a new review comment" },
                add_review_suggestion = { lhs = "<space>ecs", desc = "add a new review suggestion" },
                focus_files = { lhs = "<space>eF", desc = "move focus to changed file panel" },
                toggle_files = { lhs = "<space>eT", desc = "hide/show changed files panel" },
                next_thread = { lhs = "]t", desc = "move to next thread" },
                prev_thread = { lhs = "[t", desc = "move to previous thread" },
                select_prev_entry = { lhs = "<space>eN", desc = "move to previous changed file" },
                select_next_entry = { lhs = "<space>en", desc = "move to next changed file" },
                close_review_tab = { lhs = "<space>eC", desc = "close review tab" },
                toggle_viewed = { lhs = "<space>et", desc = "toggle viewer viewed state" },
            },
            file_panel = {
                next_entry = { lhs = "j", desc = "move to next changed file" },
                prev_entry = { lhs = "k", desc = "move to previous changed file" },
                select_entry = { lhs = "<CR>", desc = "show selected changed file diffs" },
                refresh_files = { lhs = "R", desc = "refresh changed files panel" },
                focus_files = { lhs = "<space>eF", desc = "move focus to changed file panel" },
                toggle_files = { lhs = "<space>eT", desc = "hide/show changed files panel" },
                select_prev_entry = { lhs = "<space>eN", desc = "move to previous changed file" },
                select_next_entry = { lhs = "<space>en", desc = "move to next changed file" },
                close_review_tab = { lhs = "<space>eC", desc = "close review tab" },
                toggle_viewed = { lhs = "<space>et", desc = "toggle viewer viewed state" },
            }
        }
    }
}
