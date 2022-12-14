-- Dynamic terminal padding with/without nvim (for siduck's st only)

-- replace string from file

require("custom.commands")
require("custom.options")

local options = require("custom.chadrc")
-- if options.ui.transparency
if options.ui.transparency then
	vim.g.neovide_transparency = 0.2
else
	vim.g.neovide_transparency = 1
end
vim.diagnostic.config({
	virtual_text = false,
})
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
