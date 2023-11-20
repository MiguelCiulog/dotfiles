local wezterm = require("wezterm")
local act = wezterm.action

return {
    disable_default_key_bindings = true,
    default_prog = { 'powershell.exe', '-NoLogo' },
    -- default_prog = { 'pwsh.exe', '-NoLogo' },
    -- default_prog = { "C:\\Windows\\system32\\wsl.exe -d fedora" },
    launch_menu = {
        {
            label = 'Powershell',
            args = { 'powershell.exe', '-NoLogo' },
        },
        {
            label = 'Pwsh',
            args = { 'pwsh.exe', '-NoLogo' },
        },
        {
            label = 'WSL Fedora',
            args = { 'C:\\Windows\\system32\\wsl.exe -d fedora'},
        },
    },

    font = wezterm.font("Mononoki Nerd Font Mono"),
    font_size = 14,

    window_close_confirmation = "NeverPrompt",

    -- Tab Bar
    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    show_tab_index_in_tab_bar = true,
    tab_bar_at_bottom = true,

    -- freetype_load_flags = "NO_HINTING",
    enable_kitty_keyboard = true,

    -- Colors
    color_scheme = "GruvboxDark",
    window_background_opacity = 0.97,

    use_fancy_tab_bar = false,
    tab_max_width = 75,

    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },

    -- Bell
    audible_bell = "Disabled",
    visual_bell = {
        fade_in_function = "EaseIn",
        fade_in_duration_ms = 50,
        fade_out_function = "EaseOut",
        fade_out_duration_ms = 50,
    },
    colors = {
        visual_bell = "#9c9a9a",
    },

    keys = {
        {
            key = 't',
            mods = 'CTRL|SHIFT',
            action = act.SpawnTab 'CurrentPaneDomain',
        },
        {
            key = 'w',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.CloseCurrentPane { confirm = false },
        },
        {
            key = "R",
            mods = "CTRL|SHIFT",
            action = act.PromptInputLine({
                description = "Enter new name for tab",
                action = wezterm.action_callback(function(window, _, line)
                    -- line will be `nil` if they hit escape without entering anything
                    -- An empty string if they just hit enter
                    -- Or the actual line of text they wrote
                    if line then
                        window:active_tab():set_title(line)
                    end
                end),
            }),
        },
        { key = "V",   mods = "SHIFT|CTRL",     action = act.PasteFrom("Clipboard") },
        { key = "c",   mods = "SHIFT|CTRL",     action = act.CopyTo("Clipboard") },
        { key = "Tab", mods = "CTRL",           action = act.ActivateTabRelative(1) },
        { key = "Tab", mods = "SHIFT|CTRL",     action = act.ActivateTabRelative(-1) },
        { key = "p",   mods = "SHIFT|CTRL",     action = act.ActivateCommandPalette },
        { key = '<',   mods = 'CTRL|SHIFT|ALT', action = act.MoveTabRelative(-1) },
        { key = '>',   mods = 'CTRL|SHIFT|ALT', action = act.MoveTabRelative(1) },
        -- Scroll up 1 line
        {
            key = "UpArrow",
            mods = "SHIFT",
            action = act.ScrollByLine(-10)
        },

        -- Scroll down 1 line
        {
            key = "DownArrow",
            mods = "SHIFT",
            action = act.ScrollByLine(10)
        },

        -- Navigation between panes
        {
            key = 's',
            mods = 'CTRL|ALT',
            action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
        },
        {
            key = 'v',
            mods = 'CTRL|ALT',
            action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
        },
        {
            key = 'h',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.ActivatePaneDirection 'Left',
        },
        {
            key = 'l',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.ActivatePaneDirection 'Right',
        },
        {
            key = 'k',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.ActivatePaneDirection 'Up',
        },
        {
            key = 'j',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.ActivatePaneDirection 'Down',
        },

        {
            key = 'RightArrow',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.AdjustPaneSize { "Right", 1 },
        },
        {
            key = 'LeftArrow',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.AdjustPaneSize { "Left", 1 },
        },
        {
            key = 'UpArrow',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.AdjustPaneSize { "Up", 1 },
        },
        {
            key = 'DownArrow',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.AdjustPaneSize { "Down", 1 },
        },
    },
}
