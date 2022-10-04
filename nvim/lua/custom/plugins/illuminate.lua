local status, illuminate = pcall(require, "illuminate")

if not status then
	return
end

illuminate.configure({
	-- providers: provider used to get references in the buffer, ordered by priority
	providers = {
		"lsp",
		"treesitter",
		"regex",
	},
	-- delay: delay in milliseconds
	delay = 100,
	-- filetype_overrides: filetype specific overrides.
	-- The keys are strings to represent the filetype while the values are tables that
	-- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
	filetype_overrides = {},
	-- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
	filetypes_denylist = {
		"dirvish",
		"fugitive",
		"alpha",
		"NvimTree",
		"packer",
		"neogitstatus",
		"Trouble",
		"lir",
		"Outline",
		"spectre_panel",
		"toggleterm",
		"DressingSelect",
		"TelescopePrompt",
		"aerial",
	},
	-- filetypes_allowlist: filetypes to illuminate, this is overriden by filetypes_denylist
	filetypes_allowlist = {},
	-- modes_denylist: modes to not illuminate, this overrides modes_allowlist
	modes_denylist = {},
	-- modes_allowlist: modes to illuminate, this is overriden by modes_denylist
	modes_allowlist = {},
	-- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
	-- Only applies to the 'regex' provider
	-- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
	providers_regex_syntax_denylist = {},
	-- providers_regex_syntax_allowlist: syntax to illuminate, this is overriden by providers_regex_syntax_denylist
	-- Only applies to the 'regex' provider
	-- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
	providers_regex_syntax_allowlist = {},
	-- under_cursor: whether or not to illuminate under the cursor
	under_cursor = true,
	-- max_file_lines: max number of lines in a file to illuminate
	max_file_lines = nil,
})
