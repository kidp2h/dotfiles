local present, null_ls = pcall(require, "null-ls")

local on_attach = require("plugins.configs.lspconfig").on_attach

if not present then
	return
end

local b = null_ls.builtins

local sources = {

	require("typescript.extensions.null-ls.code-actions"),
	-- Spell
	b.completion.spell,
	b.diagnostics.misspell,
	-- webdev stuff
	b.formatting.prettier,
	-- Lua
	b.formatting.stylua,
	-- b.diagnostics.luacheck,

	-- Shell
	-- b.formatting.shfmt,
	-- b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

	-- cpp
	-- b.formatting.clang_format,

	-- docker
	-- b.diagnostics.hadolint,

	-- php
	-- b.formatting.phpcsfixer,
}

null_ls.setup({
	debug = true,
	sources = sources,
	on_attach = function(client)
		vim.diagnostic.config({
			virtual_text = false,
		})
		if vim.g.vim_version > 7 then
			if client.server_capabilities.documentFormattingProvider then
				vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
				vim.o.laststatus = 2
			end
		else
			if client.resolved_capabilities.document_formatting then
				vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")

				vim.o.laststatus = 2
			end
		end
	end,
})
