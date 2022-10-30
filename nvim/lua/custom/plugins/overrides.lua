local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"html",
		"css",
		"javascript",
		"json",
		"toml",
		"markdown",
		"c",
		"bash",
		"lua",
		"php",
		"phpdoc",
		"typescript",
		"tsx",
		"graphql",
		"dockerfile",
		"bash",
		"yaml",
		"regex",
	},
	playground = {
		enable = true,
	},
	auto_install = true,
}

M.whichkey = {
	disable = true,
}

M.nvimtree = {
	git = {
		enable = true,
	},
	view = {
		float = {
			enable = true,
			open_win_config = {
				relative = "cursor",
				border = "rounded",
				row = 1,
				col = 1,
			},
		},
	},
	hijack_unnamed_buffer_when_opening = true,
	hijack_cursor = true,
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		debounce_delay = 50,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	system_open = { cmd = "thunar" },
	sync_root_with_cwd = true,
	renderer = {
		highlight_opened_files = "name",
		highlight_git = true,
		group_empty = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

M.blankline = {
	filetype_exclude = {
		"help",
		"terminal",
		"alpha",
		"packer",
		"lspinfo",
		"TelescopePrompt",
		"TelescopeResults",
		"nvchad_cheatsheet",
		"lsp-installer",
		"norg",
		"",
	},
}

M.alpha = {
	header = {
		val = {
			[[                                  __                ]],
			[[     ___     ___    ___   __  __ /\_\    ___ ___    ]],
			[[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
			[[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
			[[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
			[[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
		},
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"deno",
		"emmet-ls",
		"json-lsp",
		"graphql-language-service-cli",
		"tailwindcss-language-server",
		"eslint-lsp",
		"yaml-language-server",
		"yamllint",
		"prettier",
		"yamlfmt",
		"intelephense",

		-- shell
		"shfmt",
		"shellcheck",
	},
}

M.telescope = {
	defaults = {
		file_ignore_patterns = { "node_modules", ".docker", ".git" },
	},
	extensions = {
		repo = {
			list = {
				fd_opts = {
					"--no-ignore-vcs",
				},
				search_dirs = {
					"~/Documents/box-universe/",
				},
			},
		},
	},
	extensions_list = { "themes", "terms", "notify", "aerial", "repo", "projects", "noice" },
}

M.bufferline = {
	highlights = {
		background = {
			guibg = "NONE",
		},
		fill = {
			guibg = "NONE",
		},
		close_button = {
			guibg = "NONE",
		},
		separator_visible = {
			guibg = "NONE",
		},
		tab_close = {
			guibg = "NONE",
		},
	},
}
M.nvterm = {
	terminals = {
		type_opts = {
			float = {
				border = "rounded",
				relative = "cursor",
			},
		},
	},
	behavior = {
		close_on_exit = true,
		auto_insert = true,
	},
	enable_new_mappings = true,
}
return M
