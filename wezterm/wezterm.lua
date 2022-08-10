local wezterm = require 'wezterm'

return {
    font = wezterm.font('FantasqueSansMono Nerd Font Mono'),
    font_size = 14,

    window_close_confirmation = 'NeverPrompt',

    -- Tab Bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	show_tab_index_in_tab_bar = false,
	tab_bar_at_bottom = true,

	-- General
	window_background_opacity = 1.0,
	window_close_confirmation = "NeverPrompt",
    -- dpi = 81.0,
    
    -- OpenGL for GPU acceleration, Software for CPU
	front_end = "OpenGL",
    -- X11
	enable_wayland = true,

    keys = {
        {
            key = 'w',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.CloseCurrentTab { confirm = false },
        },
    },

    -- Kanagawa
    color_scheme = "kanagawabones",
    window_background_opacity = 0.97,

    -- use_fancy_tab_bar = false,
    window_frame = {

        font = wezterm.font{family = 'FantasqueSansMono Nerd Font Mono',
            weight = 'Bold'},
        font_size = 12,

        active_titlebar_bg= "#1F1F28",
        -- active_titlebar_bg= "#000000",
        -- inactive_titlebar_bg= "#DDD8BB",
        -- inactive_titlebar_bg= "#000000",

    --     fg_color = "#DDD8BB",
    --     bg_color = "#1F1F28",
    },

    -- use_fancy_tab_bar = false,

    colors = {
        tab_bar = {
          -- The color of the strip that goes along the top of the window
          -- (does not apply when fancy tab bar is in use)
          background = '#938AA9',

          -- The active tab is the one that has focus in the window
          active_tab = {
            -- The color of the background area for the tab
            bg_color = '#1F1F28',
            -- The color of the text for the tab
            fg_color = '#DCD7BA',
          },

          -- Inactive tabs are the tabs that do not have focus
          inactive_tab = {
            bg_color = '#16161D',
            fg_color = '#727169',

            -- The same options that were listed under the `active_tab` section above
            -- can also be used for `inactive_tab`.
          },

          -- You can configure some alternate styling when the mouse pointer
          -- moves over inactive tabs
          inactive_tab_hover = {
            bg_color = '#16161D',
            fg_color = '#727169',
            italic = true,

            -- The same options that were listed under the `active_tab` section above
            -- can also be used for `inactive_tab_hover`.
          },

          -- The new tab button that let you create new tabs
          new_tab = {
            bg_color = '#16161D',
            fg_color = '#727169',

            -- The same options that were listed under the `active_tab` section above
            -- can also be used for `new_tab`.
          },

          -- You can configure some alternate styling when the mouse pointer
          -- moves over the new tab button
          new_tab_hover = {
            bg_color = '#3b3052',
            fg_color = '#C8C093',
            italic = true,

            -- The same options that were listed under the `active_tab` section above
            -- can also be used for `new_tab_hover`.
          },
        },
    },


    -- force_reverse_video_cursor = true,
    --     foreground    = "#DDD8BB",
    --     background    = "#1F1F28",
    --     cursor_fg     = "#1F1F28",
    --     cursor_bg     = "#E6E0C2",
    --     cursor_border = "#1F1F28",
    --     selection_fg  = "#DDD8BB",
    --     selection_bg  = "#49473E",
    --     ansi = {"#1F1F28", "#E46A78", "#98BC6D", "#E5C283", "#7EB3C9",
    --     "#957FB8", "#7EB3C9", "#DDD8BB"},

    --     brights = {"#3C3C51", "#EC818C", "#9EC967", "#F1C982", "#7BC2DF",
    --     "#A98FD2", "#7BC2DF", "#A8A48D"},
}
