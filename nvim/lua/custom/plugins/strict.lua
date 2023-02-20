local present, strict = pcall(require, "nvim-strict")

if not present then
	return
end

local options = {
	included_filetypes = nil,
	excluded_filetypes = nil,
	excluded_buftypes = { "help", "nofile", "terminal", "prompt" },
	match_priority = -1,
	deep_nesting = {
		highlight = true,
		highlight_group = "DiffDelete",
		depth_limit = 3,
		ignored_trailing_characters = nil,
		ignored_leading_characters = nil,
	},
	overlong_lines = {
		highlight = true,
		highlight_group = "DiffDelete",
		length_limit = 80,
		split_on_save = true,
	},
	trailing_whitespace = {
		highlight = true,
		highlight_group = "SpellBad",
		remove_on_save = true,
	},
	trailing_empty_lines = {
		highlight = true,
		highlight_group = "SpellBad",
		remove_on_save = true,
	},
	space_indentation = {
		highlight = false,
		highlight_group = "SpellBad",
		convert_on_save = false,
	},
	tab_indentation = {
		highlight = true,
		highlight_group = "SpellBad",
		convert_on_save = true,
	},
	todos = {
		highlight = true,
		highlight_group = "DiffAdd",
	},
}

strict.setup(options)
