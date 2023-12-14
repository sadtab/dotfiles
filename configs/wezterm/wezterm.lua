-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- For example, changing the color scheme:
config.color_scheme = 'duskfox'
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = true
config.default_prog = { 'zsh' }

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.inactive_pane_hsb = {
    saturation = 1,
    brightness = 0.4,
}

config.keys = {
    -- C-M |-       to create panes
    { key = '\\',         mods = 'CTRL|ALT',       action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
    { key = '-',          mods = 'CTRL|ALT',       action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
    -- C-M c        to create tab
    { key = 'c',          mods = 'CTRL|ALT',       action = act.SpawnTab 'CurrentPaneDomain', },
    -- C-M < >      to navigate tab
    { key = ',',          mods = 'CTRL|ALT',       action = act.ActivateTabRelative(-1) },
    { key = '.',          mods = 'CTRL|ALT',       action = act.ActivateTabRelative(1) },
    -- C-M hjkl     to navigate panes
    { key = 'j',          mods = 'CTRL|ALT',       action = act.ActivatePaneDirection 'Down' },
    { key = 'k',          mods = 'CTRL|ALT',       action = act.ActivatePaneDirection 'Up' },
    { key = 'l',          mods = 'CTRL|ALT',       action = act.ActivatePaneDirection 'Right' },
    { key = 'h',          mods = 'CTRL|ALT',       action = act.ActivatePaneDirection 'Left' },
    -- C-M Arrow    to Resize panes
    { key = 'RightArrow', mods = 'CTRL|ALT',       action = act.AdjustPaneSize { 'Right', 1 }, },
    { key = 'LeftArrow',  mods = 'CTRL|ALT',       action = act.AdjustPaneSize { 'Left', 1 }, },
    { key = 'UpArrow',    mods = 'CTRL|ALT',       action = act.AdjustPaneSize { 'Up', 1 }, },
    { key = 'DownArrow',  mods = 'CTRL|ALT',       action = act.AdjustPaneSize { 'Down', 1 }, },
    -- C-M-S Arrow  to Move Tabs
    { key = 'LeftArrow',  mods = 'SHIFT|ALT|CTRL', action = act.MoveTabRelative(-1) },
    { key = 'RightArrow', mods = 'SHIFT|ALT|CTRL', action = act.MoveTabRelative(1) },

    -- Other mappings
    { key = 'F11',        mods = '',               action = act.ToggleFullScreen },
    { key = 'Space',      mods = 'CTRL|ALT',       action = act.QuickSelect },
    { key = 'v',          mods = 'CTRL|ALT',       action = act.ActivateCopyMode },
    { key = 'Insert',     mods = 'SHIFT',          action = act.PasteFrom 'Clipboard' },
}

-- Use the defaults as a base
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- make Jira clickable
table.insert(config.hyperlink_rules, {
  regex = [[(FNV4-\d{5})]],
  format = 'https://ford.atlassian.net/browse/$1',
})

-- make PR number clickable (Only for SwuTools)
-- table.insert(config.hyperlink_rules, {
--   regex = [[\#(\d{2,3})]],
--   format = 'https://github.ford.com/FNV4-FordOS/software-update-tools/pull/$1',
-- })

-- make username/project paths clickable ( Only for Github)
-- table.insert(config.hyperlink_rules, {
--   regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
--   format = 'https://www.github.com/$1/$3',
-- })

config.font = wezterm.font 'SpaceMono Nerd Font Mono'
-- config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' } -- disables ligatures

return config
