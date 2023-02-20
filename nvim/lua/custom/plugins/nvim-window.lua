local present, nvimWindow = pcall(require, "nvim-window")
if not present then
	return
end

nvimWindow.setup({
	-- The characters available for hinting windows.
	chars = {
		"a",
		"b",
		"c",
		"d",
		"e",
		"f",
		"g",
		"h",
		"i",
		"j",
		"k",
		"l",
		"m",
		"n",
		"o",
		"p",
		"q",
		"r",
		"s",
		"t",
		"u",
		"v",
		"w",
		"x",
		"y",
		"z",
	},

	-- A group to use for overwriting the Normal highlight group in the floating
	-- window. This can be used to change the background color.
	normal_hl = "Normal",

	-- The highlight group to apply to the line that contains the hint characters.
	-- This is used to make them stand out more.
	hint_hl = "Bold",

	-- The border style to use for the floating window.
	border = "single",
})
