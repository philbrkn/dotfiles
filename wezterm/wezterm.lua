local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.automatically_reload_config = true
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.default_cursor_style = "BlinkingBar"
config.color_scheme = "Tokyo Night"
config.window_background_opacity = 0.9
-- config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.font_size = 12.5
config.window_padding = {
    left = 7,
    right = 0,
    top = 2,
    bottom = 0,
}
-- config.background = {
--     	{
-- 		source = {
-- 			Color = "#282c35",
-- 		},
-- 		width = "100%",
-- 		height = "100%",
-- 		-- opacity = 0.55,
-- 		opacity = 0.90,
-- 		-- opacity = 1,
-- 	},
-- }

return config
