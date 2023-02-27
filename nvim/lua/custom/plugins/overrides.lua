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
	context_commentstring = {
		enable = true,
	},
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
		enable = false,
		show_on_dirs = false,
		debounce_delay = 50,
		icons = {
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
	tab = {
		sync = {
			open = true,
			close = true,
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
		project = {
			base_dirs = {
				{ "~/Projects/" },
			},
			hidden_files = true, -- default: false
			order_by = "asc",
			sync_with_nvim_tree = true, -- default false
		},
	},
	extensions_list = { "themes", "terms", "notify", "project" },
}

M.bufferline = {
	mode = "tabs",
	modified_icon = "●",
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
M.cmp = {

	window = {
		-- completion = {
		-- 	border = "rounded",
		-- 	winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
		-- },
		documentation = {
			border = "rounded",
		},

		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(_, vim_item)
				local icons = require("nvchad_ui.icons").lspkind
				vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
				local item = _:get_completion_item()
				if item.detail then
					vim_item.menu = item.detail
				end
				-- vim_item.menu = ({
				-- 	nvim_lsp = "(LSP)",
				-- 	emoji = "(Emoji)",
				-- 	path = "(Path)",
				-- 	calc = "(Calc)",
				-- 	cmp_tabnine = "(Tabnine)",
				-- 	vsnip = "(Snippet)",
				-- 	luasnip = "(Snippet)",
				-- 	buffer = "(Buffer)",
				-- 	tmux = "(TMUX)",
				-- 	copilot = "(Copilot)",
				-- 	treesitter = "(TreeSitter)",
				-- })[_.source.name]
			end,
		},
	},
}
M.ui = {
	statusline = {
		separator_style = "default", -- default/round/block/arrow
		overriden_modules = function()
			local X = {}

			X.mode = function()
				return ""
			end
			X.modes = function()
				return ""
			end
			X.fileInfo = function()
				return ""
			end

			X.git = function()
				return ""
			end
			X.LSP_progress = function()
				return ""
			end
			X.LSP_Diagnostics = function()
				return ""
			end
			X.LSP_status = function()
				return ""
			end
			X.cwd = function()
				return ""
			end

			X.cursor_position = function()
				return ""
			end
			return X
		end,
	},
	tabufline = {
		enabled = false,
		lazyload = false,
		overriden_modules = function()
			local X = {}
			return X
		end,
	},
}
return M
