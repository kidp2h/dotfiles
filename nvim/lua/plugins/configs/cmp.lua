local present, cmp = pcall(require, "cmp")

if not present then
	return
end

require("base46").load_highlight("cmp")
vim.opt.completeopt = "menuone,noselect"
local function border(hl_name)
	return {
		{ "", hl_name },

		{ "", hl_name },
		{ "", hl_name },
		{ "", hl_name },
		{ "", hl_name },
		{ "", hl_name },
		{ "", hl_name },
		{ "", hl_name },
	}
end

local cmp_window = require("cmp.utils.window")

cmp_window.info_ = cmp_window.info
cmp_window.info = function(self)
	local info = self:info_()
	info.scrollable = false
	return info
end

local options = {
	window = {
		-- completion = {
		-- 	border = border("CmpBorder"),
		-- 	-- winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
		-- },
		completion = cmp.config.window.bordered({
			border = border("CmpBorder"),
			side_padding = 0,
		}),
		documentation = {
			border = border("CmpDocBorder"),
		},
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {

		fields = { "kind", "abbr", "menu" },
		format = function(_, vim_item)
			local icons = require("nvchad_ui.icons").lspkind
			local duplicates = {
				buffer = 1,
				path = 1,
				nvim_lsp = 0,
				luasnip = 1,
			}
			vim_item.kind = string.format(" %s", icons[vim_item.kind])

			vim_item.menu = ({
				nvim_lsp = "[🌈] LSP",
				emoji = "[🤡] Emoji",
				path = "[🔗] Path",
				calc = "[🖥️] CALC",

				cmp_tabnine = "[🤖] TabNine",
				vsnip = "[🚀] Snippet",
				luasnip = "[💡] Snippet",
				buffer = "[👾] Buffer",
				treesitter = "[🌳] Treesitter",
			})[_.source.name]

			-- if _.source.name == "vsnip" or _.source.name == "nvim_lsp" or _.source.name == "luasnip" then
			vim_item.dup = duplicates[_.source.name] or 0
			-- end

			return vim_item
		end,
	},
	experimental = {
		ghost_text = true,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif require("luasnip").expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif require("luasnip").jumpable(-1) then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
	sources = {

		{
			name = "nvim_lsp",
			entry_filter = function(entry, ctx)
				local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
				if kind == "Snippet" and ctx.prev_context.filetype == "java" then
					return false
				end
				if kind == "Text" then
					return false
				end
				return true
			end,
		},
		{ name = "path", max_item_count = 5 },
		{ name = "luasnip", max_item_count = 10 },
		{ name = "cmp_tabnine", max_item_count = 15 },
		{ name = "nvim_lua", max_item_count = 10 },
		{ name = "buffer", max_item_count = 1 },
		{ name = "calc", max_item_count = 5 },
		{ name = "emoji", max_item_count = 5 },
		{ name = "treesitter", max_item_count = 1 },
	},
}

-- check for any override
options = require("core.utils").load_override(options, "hrsh7th/nvim-cmp")

cmp.setup(options)
