require("custom.options")
-- require("custom.plugins.timer")

vim.cmd("silent! command! Far lua require'custom.plugins.far'.findInput()")
vim.cmd("silent! command! SearchIssue lua require'custom.plugins.research'.MenuBrowser()")

local new_cmd = vim.api.nvim_create_user_command
new_cmd("EnableAutosave", function()
	require("autosave").setup()
end, {})
