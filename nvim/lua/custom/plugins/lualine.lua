local present, lualine = pcall(require, "lualine")

if not present then
	return
end

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
	white = "#ffffff",
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
		icons_enabled = true,
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
			statusline = { "neo-tree" },
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
		local modeMap = {
			["n"] = " normal",
			["no"] = " n·operator pending",
			["v"] = " visual",
			["V"] = " v·line",
			[""] = " v·block",
			["s"] = " select",
			["S"] = " s·line",
			[""] = " s·block",
			["i"] = " insert",
			["R"] = " replace",
			["Rv"] = " v·replace",
			["c"] = " command",
			["cv"] = " vim ex",
			["ce"] = " ex",
			["r"] = " prompt",
			["rm"] = " more",
			["r?"] = " confirm",
			["!"] = " shell",
			["t"] = " terminal",
		}
		return " " .. string.upper(modeMap[vim.fn.mode()])
	end,
	color = function()
		-- auto change color according to neovims mode
		--
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
		return { bg = mode_color[vim.fn.mode()], fg = colors.white, gui = "bold" }
	end,
	padding = { right = 1 },
})

ins_left({
	function()
		return ""
	end,
})

ins_left({
	-- filesize component
	"filesize",
	cond = conditions.buffer_not_empty,
	color = { fg = colors.white, bg = colors.fg },
})

ins_left({
	"filename",
	cond = conditions.buffer_not_empty,
	color = { fg = colors.white, bg = colors.magenta, gui = "bold" },
})

ins_left({ "location", color = { fg = colors.white, bg = colors.red } })

ins_left({ "progress", color = { fg = colors.white, bg = colors.yellow, gui = "bold" } })

ins_left({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " " },
	diagnostics_color = {
		color_error = { bg = colors.red, fg = colors.white },
		color_warn = { bg = colors.yellow, fg = colors.white },
		color_info = { bg = colors.cyan, fg = colors.white },
	},
	color = {
		bg = "#ffffff",
	},
})

ins_left({
	function()
		return "%="
	end,
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
		local mapLspIcon = {
			tsserver = "ﯤ ",
			lua_ls = " ",
			tailwindcss = "󱏿 ",
		}
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return mapLspIcon[client.name] .. client.name
			end
		end
		return msg
	end,
	icon = "  LSP:",
	color = { fg = colors.cyan, gui = "bold" },
})

ins_right({
	function()
		return require("battery").get_status_line()
	end,
	color = { bg = colors.violet, fg = colors.white },
})

-- Add components to right sections
ins_right({
	"o:encoding", -- option component same as &encoding in viml
	fmt = string.upper, -- I'm not sure why it's upper case either ;)
	cond = conditions.hide_in_width,
	color = { bg = colors.green, fg = colors.white, gui = "bold" },
})

ins_right({
	"fileformat",
	fmt = string.upper,
	icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
	color = { bg = colors.magenta, fg = colors.white, gui = "bold" },
})

ins_right({
	"branch",
	icon = "",
	color = { bg = colors.blue, fg = colors.white, gui = "bold" },
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
	color = { fg = colors.white, bg = colors.darkblue },
})

-- Now don't forget to initialize lualine
lualine.setup(config)
