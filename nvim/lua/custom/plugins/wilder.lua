local present, wilder = pcall(require, "wilder")
if not present then
	return
end
wilder.setup({ modes = { ":", "/", "?" } })
-- NOTE: Float

-- wilder.set_option(
-- 	"renderer",
-- 	wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
-- 		-- 'single', 'double', 'rounded' or 'solid'
-- 		-- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
-- 		border = "rounded",
-- 		max_height = "75%", -- max height of the palette
-- 		min_height = 0, -- set to the same as 'max_height' for a fixed height window
-- 		prompt_position = "bottom", -- 'top' or 'bottom' to set the location of the prompt
-- 		reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
-- 		left = { " ", wilder.popupmenu_devicons() },
-- 		highlighter = {
-- 			wilder.lua_pcre2_highlighter(), -- requires `luarocks install pcre2`
-- 			wilder.lua_fzy_highlighter(), -- requires fzy-lua-native vim plugin found
-- 			-- at https://github.com/romgrk/fzy-lua-native
-- 		},
-- 		highlights = {
-- 			accent = wilder.make_hl(
-- 				"WilderAccent",
-- 				"Pmenu",
-- 				{ { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }
-- 			),
-- 		},
-- 	}))
-- )

-- NOTE: Border theme

wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer(wilder.popupmenu_border_theme({

		left = { " ", wilder.popupmenu_devicons() },
		highlighter = {
			wilder.lua_pcre2_highlighter(), -- requires `luarocks install pcre2`
			wilder.lua_fzy_highlighter(), -- requires fzy-lua-native vim plugin found
			-- at https://github.com/romgrk/fzy-lua-native
		},
		highlights = {
			accent = wilder.make_hl("WilderAccent", "Pmenu", { { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }),
		},
		-- 'single', 'double', 'rounded' or 'solid'
		-- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
		border = "rounded",
	}))
)
