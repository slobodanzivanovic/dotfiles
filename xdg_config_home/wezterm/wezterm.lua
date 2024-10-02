local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.font = wezterm.font_with_fallback({
    "Berkeley Mono",
    "nonicons",
})

-- config.colors = {}
-- config.colors.background = "#111111"
config.color_scheme = "Catppuccin Mocha"

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
config.cursor_blink_rate = 250
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
