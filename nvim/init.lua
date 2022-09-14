vim.defer_fn(function()
	pcall(require, "impatient")
end, 0)
require("core")
require("core.options")
-- setup packer + plugins
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
	print("Cloning packer ..")
	fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })

	-- install plugins + compile their configs
	vim.cmd("packadd packer.nvim")
	require("plugins")
	vim.cmd("PackerSync")
	vim.cmd("MasonInstallAll")
end
pcall(require, "custom")

require("core.utils").load_mappings()
