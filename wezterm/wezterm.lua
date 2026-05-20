local wezterm = require("wezterm")
local act = wezterm.action

return {
	-- disable_default_key_bindings = true,
	-- font = wezterm.font("ZedMono Nerd Font Mono"),
	font_size = 14,

	window_close_confirmation = "NeverPrompt",
	-- Tab Bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	show_tab_index_in_tab_bar = true,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	enable_wayland = true,

	-- Colors
	-- color_scheme = "GruvboxDark",
	color_scheme = 'Everforest Dark (Gogh)',
	-- window_background_opacity = 0.97,

	tab_max_width = 75,

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

    -- Everforest (dark)
    background = "#272e33",
    selection_bg = "#374145",
    scrollbar_thumb = "#414b50",
    split = "#414b50",
	},

	keys = {
		{
			key = "t",
			mods = "CTRL|SHIFT",
			action = act.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "w",
			mods = "CTRL|SHIFT",
			action = wezterm.action.CloseCurrentPane({ confirm = false }),
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
		{ key = "V", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },
		{ key = "c", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
		{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
		{ key = "Tab", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(-1) },
		{ key = "p", mods = "SHIFT|CTRL", action = act.ActivateCommandPalette },
		{ key = "<", mods = "CTRL|SHIFT|ALT", action = act.MoveTabRelative(-1) },
		{ key = ">", mods = "CTRL|SHIFT|ALT", action = act.MoveTabRelative(1) },
		-- Scroll up 1 line
		{
			key = "UpArrow",
			mods = "SHIFT",
			action = act.ScrollByLine(-10),
		},

		-- Scroll down 1 line
		{
			key = "DownArrow",
			mods = "SHIFT",
			action = act.ScrollByLine(10),
		},

    -- Move with alt + left/right arrow
		{
			key = "LeftArrow",
			mods = "OPT",
			action = act.SendKey({
				key = "b",
				mods = "ALT",
			}),
		},
		{
			key = "RightArrow",
			mods = "OPT",
			action = act.SendKey({ key = "f", mods = "ALT" }),
		},

		-- Navigation between panes
		{
			key = "s",
			mods = "CTRL|ALT",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "v",
			mods = "CTRL|ALT",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "h",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivatePaneDirection("Left"),
		},
		{
			key = "l",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivatePaneDirection("Right"),
		},
		{
			key = "k",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivatePaneDirection("Up"),
		},
		{
			key = "j",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivatePaneDirection("Down"),
		},

		{
			key = "RightArrow",
			mods = "CTRL|SHIFT",
			action = wezterm.action.AdjustPaneSize({ "Right", 1 }),
		},
		{
			key = "LeftArrow",
			mods = "CTRL|SHIFT",
			action = wezterm.action.AdjustPaneSize({ "Left", 1 }),
		},
		{
			key = "UpArrow",
			mods = "CTRL|SHIFT",
			action = wezterm.action.AdjustPaneSize({ "Up", 1 }),
		},
		{
			key = "DownArrow",
			mods = "CTRL|SHIFT",
			action = wezterm.action.AdjustPaneSize({ "Down", 1 }),
		},
		{
			key = "=",
			mods = "CTRL",
			action = wezterm.action.IncreaseFontSize,
		},
		{
			key = "-",
			mods = "CTRL",
			action = wezterm.action.DecreaseFontSize,
		},
	},
}
