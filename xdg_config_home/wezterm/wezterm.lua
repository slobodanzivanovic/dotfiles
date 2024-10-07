local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.font = wezterm.font_with_fallback({
    "Berkeley Mono",
    "nonicons",
})

config.colors = {
    foreground = "#c5c8c6",
    background = "#1d1f21",
    cursor_bg = "#c5c8c6",
    cursor_fg = "#1d1f21",
    cursor_border = "#c5c8c6",
    selection_fg = "#1d1f21",
    selection_bg = "#c5c8c6",
    scrollbar_thumb = "#c5c8c6",
    split = "#444444",

    ansi = {
        "#1d1f21",
        "#cc6666",
        "#b5bd68",
        "#f0c674",
        "#81a2be",
        "#b294bb",
        "#8abeb7",
        "#c5c8c6",
    },
    brights = {
        "#666666",
        "#d54e53",
        "#b9ca4a",
        "#e7c547",
        "#7aa6da",
        "#c397d8",
        "#70c0b1",
        "#eaeaea",
    },
    indexed = {
        [16] = "#131415",
        [17] = "#864343",
        [18] = "#777c44",
        [19] = "#9e824c",
        [20] = "#556a7d",
        [21] = "#75617b",
        [22] = "#5b7d78",
        [23] = "#828482",
    },

    compose_cursor = "#1d1f21",
    visual_bell = "#e9ff5e",
}

-- config.color_scheme = "Catppuccin Mocha"

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

config.enable_scroll_bar = false
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.adjust_window_size_when_changing_font_size = false
config.audible_bell = "Disabled"
config.window_close_confirmation = "NeverPrompt"
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
config.max_fps = 90
config.animation_fps = 60
config.cursor_blink_rate = 1
config.cursor_blink_ease_in = "EaseIn"
config.cursor_blink_ease_out = "EaseOut"
config.default_cursor_style = "BlinkingBlock"

-- Windows
-- config.default_domain = "WSL:Ubuntu"

-- config.keys = {
-- 	{ key = "v", mods = "CTRL", action = wezterm.action({ PasteFrom = "Clipboard" }) },
-- }
config.keys = {
    {
        key = "f",
        mods = "ALT",
        action = wezterm.action.ToggleFullScreen,
    },
    {
        key = "t",
        mods = "SHIFT|ALT",
        action = wezterm.action.SpawnTab("CurrentPaneDomain"),
    },
}

return config
