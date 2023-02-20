local overrides = require("custom.plugins.overrides")

return {

	----------------------------------------- default plugins ------------------------------------------
	--
	["NvChad/ui"] = {
		override_options = overrides.ui,
	},
	["jackMort/ChatGPT.nvim"] = {
		opt = true,
		keys = { "<leader>gpt" },
		module_pattern = { "chatgpt*" },
		after = { "nui.nvim", "telescope.nvim" },
		config = function()
			require("custom.plugins.gpt")
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},

	["goolord/alpha-nvim"] = {
		disable = false,
		override_options = overrides.alpha,
	},

	["nvim-telescope/telescope.nvim"] = {
		override_options = overrides.telescope,
	},
	["NvChad/nvterm"] = {
		override_options = overrides.nvterm,
	},
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
		end,
	},
	["hrsh7th/nvim-cmp"] = {
		override_options = overrides.cmp,
	},

	["nvim-treesitter/nvim-treesitter"] = {
		override_options = overrides.treesitter,
	},

	["williamboman/mason.nvim"] = {
		override_options = overrides.mason,
	},
	--------------------------------------------- custom plugins ----------------------------------------------
	-- autoclose tags in html, jsx only
	["windwp/nvim-ts-autotag"] = {
		ft = { "html", "javascriptreact" },
		after = "nvim-treesitter",
		config = function()
			local present, autotag = pcall(require, "nvim-ts-autotag")

			if present then
				autotag.setup()
			end
		end,
	},

	-- format & linting
	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls")
		end,
	},

	-- distraction free modes
	["Pocco81/TrueZen.nvim"] = {
		cmd = {
			"TZAtaraxis",
			"TZMinimalist",
			"TZFocus",
		},
		config = function()
			require("custom.plugins.truezen")
		end,
	},

	-- get highlight group under cursor
	["nvim-treesitter/playground"] = {
		cmd = "TSCaptureUnderCursor",
		config = function()
			require("nvim-treesitter.configs").setup()
		end,
	},

	-- I rarely use shade.nvim/autosave.nvim so made commands to enable them

	-- dim inactive windows
	["andreadev-it/shade.nvim"] = {
		module = "shade",
		config = function()
			require("custom.plugins.shade")
		end,
	},

	-- autosave
	["Pocco81/AutoSave.nvim"] = {
		module = "autosave",
		config = function()
			require("autosave").setup()
		end,
	},

	-- notes & todo stuff
	["nvim-neorg/neorg"] = {
		tag = "0.0.12",
		ft = "norg",
		after = "nvim-treesitter",
		setup = function()
			require("custom.plugins.neorg").autocmd()
		end,
		config = function()
			require("custom.plugins.neorg").setup()
		end,
	},

	-- basic diagrams for flow charts etc
	["jbyuki/venn.nvim"] = {
		module = "venn.nvim",
		config = function()
			require("custom.plugins.venn").setup()
		end,
	},

	["rmagatti/goto-preview"] = {
		config = function()
			require("goto-preview").setup({
				border = "rounded",
				default_mappings = true,
			})
		end,
	},
	["tpope/vim-surround"] = {},
	["mattn/emmet-vim"] = {},
	["terryma/vim-multiple-cursors"] = {},
	["wakatime/vim-wakatime"] = {},
	["folke/trouble.nvim"] = {
		config = function()
			require("custom.plugins.trouble")
		end,
	},
	["folke/todo-comments.nvim"] = {
		config = function()
			require("custom.plugins.todo-comments")
		end,
	},
	-- ["romgrk/barbar.nvim"] = {},
	["tpope/vim-fugitive"] = {},
	["junegunn/gv.vim"] = {},
	["rcarriga/nvim-notify"] = {
		config = function()
			require("custom.plugins.notify")
		end,
	},
	["andweeb/presence.nvim"] = {
		config = function()
			require("custom.plugins.presence")
		end,
	},
	["phaazon/hop.nvim"] = {
		config = function()
			require("hop").setup({})
		end,
	},
	["MunifTanjim/nui.nvim"] = {},
	["folke/twilight.nvim"] = {
		config = function()
			require("custom.plugins.twilight")
		end,
	},
	["stevearc/dressing.nvim"] = {
		config = function()
			require("custom.plugins.dressing")
		end,
	},
	["romgrk/barbar.nvim"] = {},
	["xiyaowong/nvim-transparent"] = {
		enable = true, -- boolean: enable transparent
		extra_groups = { -- table/string: additional groups that should be cleared
			"BufferLineTabClose",
			"BufferlineBufferSelected",
			"BufferLineFill",
			"BufferLineBackground",
			"BufferLineSeparator",
			"BufferLineIndicatorSelected",
		},
		exclude = {}, -- table: groups you don't want to clear
	},
	["https://git.sr.ht/~whynothugo/lsp_lines.nvim"] = {
		config = function()
			require("lsp_lines").setup()
		end,
	},
	["weilbith/nvim-code-action-menu"] = {
		cmd = "CodeActionMenu",
	},
	["lewis6991/spellsitter.nvim"] = {
		config = function()
			require("spellsitter").setup({
				-- Whether enabled, can be a list of filetypes, e.g. {'python', 'lua'}
				enable = true,
				debug = false,
			})
		end,
	},
	["gelguy/wilder.nvim"] = {
		rocks = "pcre2",
		config = function()
			require("custom.plugins.wilder")
		end,
	},
	-- ["onsails/lspkind.nvim"] = {
	--
	-- 	config = function()
	-- 		local lspkind = require("lspkind")
	-- 		require("cmp").setup({
	-- 			formatting = {
	-- 				format = lspkind.cmp_format({
	-- 					mode = "symbol", -- show only symbol annotations
	-- 					maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
	--
	-- 					-- The function below will be called before any actual modifications from lspkind
	-- 					-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
	-- 					before = function(entry, vim_item)
	-- 						return vim_item
	-- 					end,
	-- 				}),
	-- 			},
	-- 		})
	-- 	end,
	-- },
	["jamestthompson3/nvim-remote-containers"] = {},
	["linty-org/key-menu.nvim"] = {
		config = function()
			vim.keymap.set("n", " ", function()
				require("key-menu").open_window(" ")
			end)

			vim.keymap.set("n", "g", function()
				require("key-menu").open_window("g")
			end)
		end,
	},
	["lvimuser/lsp-inlayhints.nvim"] = {
		config = function()
			require("custom.plugins.lsp-inlayhints")
		end,
	},
	["nvim-lualine/lualine.nvim"] = {
		config = function()
			require("custom.plugins.lualine")
		end,
	},

	["lukas-reineke/indent-blankline.nvim"] = {
		override_options = {
			indentLine_enabled = 1,
			filetype_exclude = {
				"help",
				"terminal",
				"alpha",
				"packer",
				"lspinfo",
				"TelescopePrompt",
				"TelescopeResults",
				"mason",
				"",
			},
			buftype_exclude = { "terminal" },
			show_trailing_blankline_indent = false,
			show_first_indent_level = false,
			show_current_context = true,
			show_current_context_start = true,
			char_highlight_list = {
				"IndentBlanklineIndent1",
				"IndentBlanklineIndent2",
				"IndentBlanklineIndent3",
				"IndentBlanklineIndent4",
				"IndentBlanklineIndent5",
				"IndentBlanklineIndent6",
			},
		},
	},
	["kdheepak/lazygit.nvim"] = {},
	["akinsho/git-conflict.nvim"] = {
		config = function()
			require("git-conflict").setup({
				default_mappings = true, -- disable buffer local mapping created by this plugin
				disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
				highlights = { -- They must have background color, otherwise the default color will be used
					incoming = "DiffText",
					current = "DiffAdd",
				},
			})
		end,
	},
	["anuvyklack/pretty-fold.nvim"] = {
		config = function()
			require("pretty-fold").setup({
				keep_indentation = false,
				fill_char = "━",
				sections = {
					left = {
						"━ ",
						function()
							return string.rep("*", vim.v.foldlevel)
						end,
						" ━┫",
						"content",
						"┣",
					},
					right = {
						"┫ ",
						"number_of_folded_lines",
						": ",
						"percentage",
						" ┣━━",
					},
				},
			})
		end,
	},
	["preservim/tagbar"] = {},
	["ray-x/lsp_signature.nvim"] = {},
	["m-demare/hlargs.nvim"] = {
		config = function()
			require("hlargs").setup({})
		end,
	},
	["RRethy/vim-illuminate"] = {
		config = function()
			require("custom.plugins.illuminate")
		end,
	},
	["cljoly/telescope-repo.nvim"] = {},
	["nacro90/numb.nvim"] = {
		config = function()
			require("numb").setup({
				show_numbers = true, -- Enable 'number' for the window while peeking
				show_cursorline = true, -- Enable 'cursorline' for the window while peeking
				number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
				centered_peeking = true, -- Peeked line will be centered relative to window
			})
		end,
	},
	["kevinhwang91/nvim-hlslens"] = {
		config = function()
			require("hlslens").setup()
		end,
	},
	["nvim-telescope/telescope-project.nvim"] = {
		requires = "nvim-telescope/telescope.nvim",
	},
	["glepnir/lspsaga.nvim"] = {
		config = function()
			require("custom.plugins.lspsaga")
		end,
		commit = "707c9399b1cbe063c6942604209674edf1b3cf2e",
	},
	["folke/tokyonight.nvim"] = {},
	["melkster/modicator.nvim"] = {
		config = function()
			require("custom.plugins.modicator")
		end,
	},
	["j-hui/fidget.nvim"] = {
		config = function()
			require("fidget").setup({})
		end,
	},
	["rafamadriz/friendly-snippets"] = {},
	["f-person/git-blame.nvim"] = {},
	["folke/noice.nvim"] = {
		config = function()
			require("custom.plugins.noice")
		end,
	},
	["https://gitlab.com/yorickpeterse/nvim-window"] = {
		config = function()
			require("custom.plugins.nvim-window")
		end,
	},
	["kevinhwang91/nvim-ufo"] = {
		requires = "kevinhwang91/promise-async",
		config = function()
			require("custom.plugins.ufo")
		end,
	},
	["kevinhwang91/rnvimr"] = {
		cmd = "RnvimrToggle",
		config = function()
			vim.g.rnvimr_draw_border = 1
			ufo.luaim.g.rnvimr_pick_enable = 1
			vim.g.rnvimr_bw_enable = 1
		end,
	},
	["nvim-treesitter/nvim-treesitter-textobjects"] = {
		config = function()
			require("custom.plugins.textobjects")
		end,
	},
	["camspiers/snap"] = {
		rocks = "fzy",
		config = function()
			local snap = require("snap")
			local layout = snap.get("layout").bottom
			local file = snap.config.file:with({ consumer = "fzy", layout = layout })
			local vimgrep = snap.config.vimgrep:with({ layout = layout })
			snap.register.command("find_files", file({ producer = "ripgrep.file" }))
			snap.register.command("buffers", file({ producer = "vim.buffer" }))
			snap.register.command("oldfiles", file({ producer = "vim.oldfile" }))
			snap.register.command("live_grep", vimgrep({}))
		end,
	},
	["sindrets/diffview.nvim"] = {
		events = "BufRead",
	},
	["JoosepAlviste/nvim-ts-context-commentstring"] = {},
	["romgrk/nvim-treesitter-context"] = {
		config = function()
			require("treesitter-context").setup({
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				throttle = true, -- Throttles plugin updates (may improve performance)
				max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
				patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
					-- For all filetypes
					-- Note that setting an entry here replaces all other patterns for this entry.
					-- By setting the 'default' entry below, you can control which nodes you want to
					-- appear in the context window.
					default = {
						"class",
						"function",
						"method",
					},
				},
			})
		end,
	},

	["emileferreira/nvim-strict"] = {
		config = function()
			require("custom.plugins.strict")
		end,
	},
	["hrsh7th/cmp-nvim-lsp"] = {},
	["tzachar/cmp-tabnine"] = {
		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
		config = function()
			local tabnine = require("cmp_tabnine.config")

			tabnine:setup({
				max_lines = 1000,
				max_num_results = 20,
				sort = true,
				run_on_every_keystroke = true,
				snippet_placeholder = "..",
				ignored_file_types = {
					-- default is not to ignore
					-- uncomment to ignore in lua:
					-- lua = true
				},
				show_prediction_strength = false,
			})
		end,
	},
	["romgrk/fzy-lua-native"] = {},
	["voldikss/vim-floaterm"] = {},

	["ray-x/cmp-treesitter"] = {},
	["hrsh7th/cmp-emoji"] = {},

	["hrsh7th/cmp-calc"] = {},
	["justinhj/battery.nvim"] = {
		config = function()
			local battery = require("battery")
			battery.setup({
				update_rate_seconds = 30, -- Number of seconds between checking battery status
				show_status_when_no_battery = true, -- Don't show any icon or text when no battery found (desktop for example)
				show_plugged_icon = true, -- If true show a cable icon alongside the battery icon when plugged in
				show_unplugged_icon = true, -- When true show a diconnected cable icon when not plugged in
				show_percent = true, -- Whether or not to show the percent charge remaining in digits
				vertical_icons = true, -- When true icons are vertical, otherwise shows horizontal battery icon
				multiple_battery_selection = 1, -- Which battery to choose when multiple found. "max" or "maximum", "min" or "minimum" or a number to pick the nth battery found (currently linux acpi only)
			})
		end,
	},

	["nvim-neo-tree/neo-tree.nvim"] = {
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			{
				-- only needed if you want to use the commands with "_with_window_picker" suffix
				"s1n7ax/nvim-window-picker",
				tag = "v1.*",
				config = function()
					require("window-picker").setup({
						autoselect_one = true,
						include_current = false,
						filter_rules = {
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { "neo-tree", "neo-tree-popup", "notify" },

								-- if the buffer type is one of following, the window will be ignored
								buftype = { "terminal", "quickfix" },
							},
						},
						other_win_hl_color = "#e35e4f",
					})
				end,
			},
			{
				"mrbjarksen/neo-tree-diagnostics.nvim",
				module = "neo-tree.sources.diagnostics",
			},
		},
		config = function()
			require("custom.plugins.neotree")
		end,
	},
	-- ["barrett-ruth/import-cost.nvim"] = {
	-- 	build = "sh install.sh npm",
	-- 	config = function()
	-- 		require("custom.plugins.import-cost")
	-- 	end,
	-- },
	-- ["https://git.sr.ht/~nedia/auto-save.nvim"] = {
	-- 	config = function()
	-- 		require("custom.plugins.auto-save")
	-- 	end,
	-- },
}
