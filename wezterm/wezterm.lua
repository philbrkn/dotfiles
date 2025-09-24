local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.automatically_reload_config = true
-- config.enable_tab_bar = false
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.show_tab_index_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

-- Add this function that was missing
function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab_title(tab)
	if tab.is_active then
		return {
			{ Text = "  " .. title .. "  " }, -- spaces for separation
		}
	end
	if tab.is_last_active then
		return {
			{ Text = "      " .. title .. "*      " }, -- spaces for separation
		}
	end
	-- Fix: Return a format table for inactive tabs too
	return {
		{ Text = "     " .. title .. "      " },
	}
end)

config.tab_max_width = 50
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.default_cursor_style = "SteadyBlock"
config.color_scheme = "Tokyo Night"
-- config.window_background_opacity = 0.9
-- config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.font_size = 12.5
config.window_padding = {
	left = 7,
	right = 0,
	top = 2,
	bottom = 0,
}
config.background = {
	{
		source = {
			File = os.getenv("HOME") .. "/.config/wezterm/nuweiba.jpg",
		},
		width = "100%",
		height = "100%",
		-- opacity = 0.55,
		opacity = 0.90,
		-- opacity = 1,
	},
	{
		source = {
			Color = "#282c35",
		},
		width = "100%",
		height = "100%",
		-- opacity = 0.55,
		opacity = 0.91,
		-- opacity = 1,
	},
}

return config
