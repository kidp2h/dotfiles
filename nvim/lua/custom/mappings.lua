local M = {}

M.general = {
	n = {
		[";"] = { ":", "command mode", opts = { nowait = true } },
	},

	i = {
		["jk"] = { "<ESC>", "escape vim" },
	},
}

M.venn = {
	n = {
		["vn"] = {
			function()
				require("custom.plugins.venn").toggle_maps()
			end,
			"toggle venn mappings",
		},
	},
}

M.truzen = {
	n = {
		["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "truzen ataraxis" },
		["<leader>tm"] = { "<cmd> TZMinimalist <CR>", "truzen minimal" },
		["<leader>tf"] = { "<cmd> TZFocus <CR>", "truzen focus" },
	},
}

M.projects = {
	n = {
		["<C-p>"] = { "<cmd> Telescope project <CR>", "Switch Projects" },
	},
}

M.treesitter = {
	n = {
		["<leader>cu"] = { "<cmd> TSCaptureUnderCursor <CR>", "find media" },
	},
}

M.shade = {
	n = {
		["<leader>s"] = {
			function()
				require("shade").toggle()
			end,

			"toggle shade.nvim",
		},
	},
}

M.navigation = {
	n = {
		["H"] = { "^", "beginning of line" },
		["L"] = { "$", "end of line" },
	},
}

M.Barbar = {
	n = {
		["<A-.>"] = { ":BufferNext<CR>", "Next Buffer", opts = { silent = true } },
		["<A-,>"] = { ":BufferPrevious<CR>", "Previous Buffer", opts = { silent = true } },
		["<A-1>"] = { ":BufferGoto 1<CR>", "Goto buffer 1", opts = { silent = true } },
		["<A-2>"] = { ":BufferGoto 2<CR>", "Goto buffer 2", opts = { silent = true } },
		["<A-3>"] = { ":BufferGoto 3<CR>", "Goto buffer 3", opts = { silent = true } },
		["<A-4>"] = { ":BufferGoto 4<CR>", "Goto buffer 4", opts = { silent = true } },
		["<A-5>"] = { ":BufferGoto 5<CR>", "Goto buffer 5", opts = { silent = true } },
		["<A-6>"] = { ":BufferGoto 6<CR>", "Goto buffer 6", opts = { silent = true } },
		["<A-7>"] = { ":BufferGoto 7<CR>", "Goto buffer 7", opts = { silent = true } },
		["<A-8>"] = { ":BufferGoto 8<CR>", "Goto buffer 8", opts = { silent = true } },
		["<A-9>"] = { ":BufferGoto 9<CR>", "Goto buffer 9", opts = { silent = true } },
		["<leader>cc"] = {
			":BufferCloseAllButCurrentOrPinned<CR>",
			"Close all but keep current or pinned",
			opts = { silent = true },
		},
		["<A-0>"] = { ":BufferLast<CR>", "Goto last buffer", opts = { silent = true } },
	},
}

M.Far = {
	n = {
		["<A-f>"] = { ":Far<CR>" },
	},
	i = {
		["<A-f>"] = { ":Far<CR>" },
	},
}

M.Hop = {
	n = {
		["<leader>hl"] = { ":HopLineStart<CR>" },
		["<leader>hw"] = { ":HopWordCurrentLine<CR>" },
	},
}
M.SaveFile = {
	i = {
		["<C-s>"] = {
			-- "<ESC>:w | lua require'notify'('Saving file ....', 'success', {title = 'System', timeout = 1000})<cr>",
			"<ESC>:w<cr>",
			"Save file in insert mode",
			opts = { silent = true },
		},
	},
	n = {
		["<C-s>"] = {
			"<ESC>:w<cr>",
			"Save file in normal mode",
			opts = { silent = true },
		},
	},
}

M.NvimTree = {
	n = {
		["<C-b>"] = { "<cmd>Neotree float reveal toggle <CR>", "toggle nvimtree" },
		["<leader>e"] = { "<cmd>Neotree float reveal toggle <CR>", "toggle nvimtree" },
	},

	i = {
		["<C-b>"] = { "<cmd>Neotree float reveal toggle <CR>", "toggle nvimtree" },
	},
}

M.Trouble = {
	n = {
		["<A-m>"] = { ":TroubleToggle<cr>", "Open trouble window" },
	},
}
M.Telescope = {
	n = {
		["<leader>ft"] = { ":TodoTelescope<cr>", "   Open Todo Telescope" },
	},
}
M.PreventArrow = {
	n = {
		["<up>"] = {
			"<nop>",
			"Don't use arrow",
		},
		["<down>"] = {
			"<nop>",
			"Don't use arrow",
		},
		["<right>"] = {
			"<nop>",
			"Don't use arrow",
		},
		["<left>"] = {
			"<nop>",
			"Don't use arrow",
		},
	},
}

M.lspconfig = {
	plugin = true,

	-- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

	n = {

		["gh"] = {
			"<cmd>Lspsaga lsp_finder<CR>",
			"lsp finder",
			opts = {
				silent = true,
			},
		},
		["gd"] = {
			"<cmd>Lspsaga peek_definition<CR>",
			"lsp finder",
			opts = {
				silent = true,
			},
		},
		["<leader>o"] = {
			"<cmd>LSoutlineToggle<CR>",
			"lspsaga outline",
			opts = {
				silent = true,
			},
		},

		["<C-[>"] = {
			"<cmd>Lspsaga diagnostic_jump_prev<CR>",
			"goto prev",
			opts = {
				silent = true,
			},
		},

		["<C-]>"] = {
			"<cmd>Lspsaga diagnostic_jump_next<CR>",
			"goto next",
			opts = {
				silent = true,
			},
		},

		["K"] = {
			"<cmd>Lspsaga hover_doc<CR>",
			"lspsaga hover doc",
			opts = {
				silent = true,
			},
		},
		["<leader>f"] = {
			"<cmd>Lspsaga show_cursor_diagnostics<CR>",
			"Lspsaga show diagnostic",
			opts = {
				silent = true,
			},
		},
		["<leader>ca"] = {
			"<cmd>Lspsaga code_action<CR>",
			"Lspsaga code action",
			opts = {
				silent = true,
			},
		},
	},
}

M.windows = {
	n = {

		["<A-w>"] = {
			"<cmd>lua require'nvim-window'.pick()<CR>",
			"Pick Window",
			opts = {
				silent = true,
			},
		},
	},
}

return M
