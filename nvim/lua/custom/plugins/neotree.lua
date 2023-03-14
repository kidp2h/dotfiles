local neo_tree_status_ok, neo_tree = pcall(require, "neo-tree")
if not neo_tree_status_ok then
	return
end
neo_tree.setup({
	use_popups_for_input = true,
	popup_border_style = { " ", " ", " ", " ", " ", " ", " ", " " },
	enable_diagnostics = true,
	statusline = false,
	sources = {
		"filesystem",
		"buffers",
		"git_status",
		"diagnostics",
	},
	source_selector = {
		winbar = true,
		separator = "",
		content_layout = "center",
		tab_labels = {
			filesystem = "  DIR  ",
			buffers = "﬘  BUF  ",
			git_status = "  GIT  ",
			diagnostics = "  LSP  ",
		},
	},
	default_component_configs = {
		container = {
			enable_character_fade = true,
		},
		indent = {
			with_markers = false,
			with_expanders = true,
		},
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "",
			highlight = "NeoTreeFileIcon",
		},
		modified = {
			symbol = "",
		},
		git_status = {
			symbols = {
				added = "",
				deleted = "",
				modified = "",
				renamed = "",
				untracked = "",
				ignored = "",
				unstaged = "",
				staged = "",
				conflict = "",
			},
			align = "right",
		},
	},
	window = {
		position = "left",
		width = 40,
		mappings = {
			["Z"] = "expand_all_nodes",
		},
	},
	filesystem = {
		follow_current_file = true,
		use_libuv_file_watcher = true,
	},
	diagnostics = {
		autopreview = true,
		autopreview_config = {},
		autopreview_event = "neo_tree_buffer_enter",
		bind_to_cwd = true,
		diag_sort_function = "severity",
		follow_behavior = {
			always_focus_file = true,
			expand_followed = true,
			collapse_others = true,
		},
		follow_current_file = true,
		group_dirs_and_files = true,
		group_empty_dirs = true,
		show_unloaded = true,
	},
})
vim.keymap.set("n", "<S-x>", function()
	vim.cmd("Neotree filesystem left")
end, { noremap = true, silent = true, desc = "Neotree filesystem" })
vim.keymap.set("n", "<S-b>", function()
	vim.cmd("Neotree buffers left")
end, { noremap = true, silent = true, desc = "Neotree buffers" })
vim.keymap.set("n", "<S-t>", function()
	vim.cmd("Neotree git_status left")
end, { noremap = true, silent = true, desc = "Neotree git_status" })
vim.keymap.set("n", "<S-l>", function()
	vim.cmd("Neotree diagnostics left")
end, { noremap = true, silent = true, desc = "Neotree diagnostics" })
vim.keymap.set("n", "<A-e>", function()
	vim.cmd("Neotree diagnostics reveal bottom")
end, { noremap = true, silent = true, desc = "Neotree diagnostics bottom" })
