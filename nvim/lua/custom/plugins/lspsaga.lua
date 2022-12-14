local present, lspsaga = pcall(require, "lspsaga")

if not present then
	return
end

lspsaga.init_lsp_saga({
	symbol_in_winbar = {
		in_custom = false,
		enable = true,
		separator = " ",
		show_file = true,
		-- define how to customize filename, eg: %:., %
		-- if not set, use default value `%:t`
		-- more information see `vim.fn.expand` or `expand`
		-- ## only valid after set `show_file = true`
		file_formatter = "",
		click_support = function(node, clicks, button, modifiers)
			-- To see all available details: vim.pretty_print(node)
			local st = node.range.start
			local en = node.range["end"]
			if button == "l" then
				if clicks == 2 then
				-- double left click to do nothing
				else -- jump to node's starting line+char
					vim.fn.cursor(st.line + 1, st.character + 1)
				end
			elseif button == "r" then
				if modifiers == "s" then
					print("lspsaga") -- shift right click to print "lspsaga"
				end -- jump to node's ending line+char
				vim.fn.cursor(en.line + 1, en.character + 1)
			elseif button == "m" then
				-- middle click to visual select node
				vim.fn.cursor(st.line + 1, st.character + 1)
				vim.cmd("normal v")
				vim.fn.cursor(en.line + 1, en.character + 1)
			end
		end,
	},
	border_style = "rounded",
})
