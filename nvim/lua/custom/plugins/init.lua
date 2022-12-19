local overrides = require("custom.plugins.overrides")

return {

	----------------------------------------- default plugins ------------------------------------------
	--
	["NvChad/ui"] = {
		-- after = "base46",
		-- module = "nvchad_ui",
		-- config = function()
		-- 	local present, nvchad_ui = pcall(require, "nvchad_ui")
		--
		-- 	if present then
		-- 		nvchad_ui.setup({
		-- 			statusline = nil,
		-- 			tabufline = {
		-- 				enable = false,
		-- 			},
		-- 		})
		-- 	end
		-- end,
		override_options = overrides.ui,
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
	-- override default configs
	["kyazdani42/nvim-tree.lua"] = {
		override_options = overrides.nvimtree,
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
	-- ["SmiteshP/nvim-navic"] = {
	-- 	requires = "neovim/nvim-lspconfig",
	-- 	config = function()
	-- 		require("custom.plugins.navic")
	-- 	end,
	-- },
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
			local present, wilder = pcall(require, "wilder")
			if not present then
				return
			end
			wilder.setup({ modes = { ":", "/", "?" } })
			wilder.set_option(
				"renderer",
				wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
					-- 'single', 'double', 'rounded' or 'solid'
					-- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
					border = "rounded",
					max_height = "75%", -- max height of the palette
					min_height = 0, -- set to the same as 'max_height' for a fixed height window
					prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
					reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
					left = { " ", wilder.popupmenu_devicons() },
					highlighter = {
						wilder.lua_pcre2_highlighter(), -- requires `luarocks install pcre2`
						wilder.lua_fzy_highlighter(), -- requires fzy-lua-native vim plugin found
						-- at https://github.com/romgrk/fzy-lua-native
					},
					highlights = {
						accent = wilder.make_hl(
							"WilderAccent",
							"Pmenu",
							{ { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }
						),
					},
				}))
			)
		end,
	},
	["onsails/lspkind.nvim"] = {

		config = function()
			local lspkind = require("lspkind")
			require("cmp").setup({
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol", -- show only symbol annotations
						maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

						-- The function below will be called before any actual modifications from lspkind
						-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
						before = function(entry, vim_item)
							return vim_item
						end,
					}),
				},
			})
		end,
	},
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
			require("lsp-inlayhints").setup({
				inlay_hints = {
					parameter_hints = {
						show = true,
						prefix = "<- ",
						separator = ", ",
						remove_colon_start = false,
						remove_colon_end = true,
					},
					type_hints = {
						-- type and other hints
						show = true,
						prefix = "",
						separator = ", ",
						remove_colon_start = false,
						remove_colon_end = false,
					},
					only_current_line = false,
					-- separator between types and parameter hints. Note that type hints are
					-- shown before parameter
					labels_separator = "  ",
					-- whether to align to the length of the longest line in the file
					max_len_align = false,
					-- padding from the left if max_len_align is true
					max_len_align_padding = 1,
					-- highlight group
					highlight = "LspInlayHint",
				},
				enabled_at_startup = true,
				debug_mode = false,
			})
		end,
	},
	-- ["glepnir/galaxyline.nvim"] = {
	-- 	branch = "main",
	-- 	config = function()
	-- 		require("custom.plugins.galaxyline")
	-- 	end,
	-- },
	["nvim-lualine/lualine.nvim"] = {
		config = function()
			local lualine = require("lualine")

			local colors = {
				bg = "#00000000",
				fg = "#bbc2cf",
				yellow = "#ECBE7B",
				cyan = "#008080",
				darkblue = "#081633",
				green = "#98be65",
				orange = "#FF8800",
				violet = "#a9a1e1",
				magenta = "#c678dd",
				blue = "#51afef",
				red = "#ec5f67",
			}

			local conditions = {
				buffer_not_empty = function()
					return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
				end,
				hide_in_width = function()
					return vim.fn.winwidth(0) > 80
				end,
				check_git_workspace = function()
					local filepath = vim.fn.expand("%:p:h")
					local gitdir = vim.fn.finddir(".git", filepath .. ";")
					return gitdir and #gitdir > 0 and #gitdir < #filepath
				end,
			}

			-- Config
			local config = {
				options = {
					-- Disable sections and component separators
					component_separators = "",
					section_separators = "",
					theme = {
						-- We are going to use lualine_c an lualine_x as left and
						-- right section. Both are highlighted by c theme .  So we
						-- are just setting default looks o statusline
						normal = { c = { fg = colors.fg, bg = colors.bg } },
						inactive = { c = { fg = colors.fg, bg = colors.bg } },
					},
					disabled_filetypes = {
						statusline = { "NvimTree" },
					},
					globalstatus = true,
				},
				sections = {
					-- these are to remove the defaults
					lualine_a = {},
					lualine_b = {},
					lualine_y = {},
					lualine_z = {},
					-- These will be filled later
					lualine_c = {},
					lualine_x = {},
				},
				inactive_sections = {
					-- these are to remove the defaults
					lualine_a = {},
					lualine_b = {},
					lualine_y = {},
					lualine_z = {},
					lualine_c = {},
					lualine_x = {},
				},
			}

			-- Inserts a component in lualine_c at left section
			local function ins_left(component)
				table.insert(config.sections.lualine_c, component)
			end

			-- Inserts a component in lualine_x ot right section
			local function ins_right(component)
				table.insert(config.sections.lualine_x, component)
			end

			ins_left({
				-- mode component
				function()
					return ""
				end,
				color = function()
					-- auto change color according to neovims mode
					local mode_color = {
						n = colors.red,
						i = colors.green,
						v = colors.blue,
						[""] = colors.blue,
						V = colors.blue,
						c = colors.magenta,
						no = colors.red,
						s = colors.orange,
						S = colors.orange,
						[""] = colors.orange,
						ic = colors.yellow,
						R = colors.violet,
						Rv = colors.violet,
						cv = colors.red,
						ce = colors.red,
						r = colors.cyan,
						rm = colors.cyan,
						["r?"] = colors.cyan,
						["!"] = colors.red,
						t = colors.red,
					}
					return { fg = mode_color[vim.fn.mode()] }
				end,
				padding = { right = 1 },
			})

			ins_left({
				-- filesize component
				"filesize",
				cond = conditions.buffer_not_empty,
			})

			ins_left({
				"filename",
				cond = conditions.buffer_not_empty,
				color = { fg = colors.magenta, gui = "bold" },
			})

			ins_left({ "location" })

			ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

			ins_left({
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " " },
				diagnostics_color = {
					color_error = { fg = colors.red },
					color_warn = { fg = colors.yellow },
					color_info = { fg = colors.cyan },
				},
			})

			-- Insert mid section. You can make any number of sections in neovim :)
			-- for lualine it's any number greater then 2
			ins_left({
				function()
					return "%="
				end,
			})

			ins_left({
				-- Lsp server name .
				function()
					local msg = "No Active Lsp"
					local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
					local clients = vim.lsp.get_active_clients()
					if next(clients) == nil then
						return msg
					end
					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes
						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							return client.name
						end
					end
					return msg
				end,
				icon = " LSP:",
				color = { fg = colors.cyan, gui = "bold" },
			})

			-- Add components to right sections
			ins_right({
				"o:encoding", -- option component same as &encoding in viml
				fmt = string.upper, -- I'm not sure why it's upper case either ;)
				cond = conditions.hide_in_width,
				color = { fg = colors.green, gui = "bold" },
			})

			ins_right({
				"fileformat",
				fmt = string.upper,
				icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
				color = { fg = colors.green, gui = "bold" },
			})

			ins_right({
				"branch",
				icon = "",
				color = { fg = colors.violet, gui = "bold" },
			})

			ins_right({
				"diff",
				-- Is it me or the symbol for modified us really weird
				symbols = { added = " ", modified = "柳 ", removed = " " },
				diff_color = {
					added = { fg = colors.green },
					modified = { fg = colors.orange },
					removed = { fg = colors.red },
				},
				cond = conditions.hide_in_width,
			})

			-- Now don't forget to initialize lualine
			lualine.setup(config)
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
	-- ["b0o/incline.nvim"] = {
	-- 	config = function()
	-- 		require("custom.plugins.incline")
	-- 	end,
	-- },

	-- ["anuvyklack/windows.nvim"] = {
	--
	-- 	requires = {
	-- 		"anuvyklack/middleclass",
	-- 		"anuvyklack/animation.nvim",
	-- 	},
	-- 	config = function()
	-- 		vim.opt.winwidth = 10
	-- 		vim.opt.winminwidth = 10
	-- 		vim.opt.equalalways = false
	-- 		require("windows").setup()
	-- 	end,
	-- },
	["kdheepak/lazygit.nvim"] = {},
	-- ["stevearc/aerial.nvim"] = {
	-- 	config = function()
	-- 		require("custom.plugins.aerial")
	-- 	end,
	-- },
	-- ["tveskag/nvim-blame-line"] = {},
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
	-- ["ahmedkhalf/project.nvim"] = {
	-- 	config = function()
	-- 		require("custom.plugins.project")
	-- 	end,
	-- },
	--
	["nvim-telescope/telescope-project.nvim"] = {
		requires = "nvim-telescope/telescope.nvim",
	},
	["glepnir/lspsaga.nvim"] = {
		config = function()
			require("custom.plugins.lspsaga")
		end,
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
	-- ["folke/noice.nvim"] = {
	-- 	config = function()
	-- 		require("noice").setup({
	-- 			lsp = {
	-- 				hover = {
	-- 					enabled = false,
	-- 				},
	-- 				signature = {
	-- 					enabled = false,
	-- 				},
	-- 			},
	-- 			notify = {
	-- 				enabled = false,
	-- 			},
	-- 			views = {
	-- 				cmdline_popup = {
	-- 					position = {
	-- 						row = 5,
	-- 						col = "50%",
	-- 					},
	-- 					size = {
	-- 						width = 60,
	-- 						height = "auto",
	-- 					},
	-- 				},
	-- 				popupmenu = {
	-- 					relative = "editor",
	-- 					position = {
	-- 						row = 8,
	-- 						col = "50%",
	-- 					},
	-- 					size = {
	-- 						width = 60,
	-- 						height = 10,
	-- 					},
	-- 					border = {
	-- 						style = "rounded",
	-- 						padding = { 0, 1 },
	-- 					},
	-- 					win_options = {
	-- 						winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
	-- 					},
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },
	["https://gitlab.com/yorickpeterse/nvim-window"] = {
		config = function()
			require("nvim-window").setup({
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
		end,
	},
	["kevinhwang91/nvim-ufo"] = {
		requires = "kevinhwang91/promise-async",
		config = function()
			local handler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local suffix = ("  %d "):format((endLnum - lnum) + 1)
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0
				for _, chunk in ipairs(virtText) do
					local chunkText = chunk[1]
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						local hlGroup = chunk[2]
						table.insert(newVirtText, { chunkText, hlGroup })
						chunkWidth = vim.fn.strdisplaywidth(chunkText)
						-- str width returned from truncate() may less than 2nd argument, need padding
						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end
				table.insert(newVirtText, { suffix, "MoreMsg" })
				return newVirtText
			end
			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "lsp", "indent" }
				end,
				fold_virt_text_handler = handler,
			})
			vim.o.foldcolumn = "1" -- '0' is not bad
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
			vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
			vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
			vim.keymap.set("n", "K", function()
				local winid = require("ufo").peekFoldedLinesUnderCursor()
				if not winid then
					-- choose one of coc.nvim and nvim lsp
					vim.lsp.buf.hover()
				end
			end)
		end,
	},
	["kevinhwang91/rnvimr"] = {
		cmd = "RnvimrToggle",
		config = function()
			vim.g.rnvimr_draw_border = 1
			vim.g.rnvimr_pick_enable = 1
			vim.g.rnvimr_bw_enable = 1
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
	["romgrk/fzy-lua-native"] = {},
}
