local opt = vim.opt
local global = vim.g
opt.relativenumber = true
opt.number = true
opt.swapfile = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.wrap = false
opt.numberwidth = 2
opt.smarttab = true
opt.fileencoding = "utf-8"
opt.termguicolors = true
opt.smartcase = true
opt.guifont = { "MonoLisa Nerd Font:h13" }
opt.foldcolumn = "1"
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true
opt.laststatus = 2
opt.fillchars = [[eob: ,vert: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.cmdheight = 0
opt.pumheight = 10
opt.showmode = false
opt.showcmd = false
opt.undofile = true -- enable persistent undo
opt.updatetime = 100
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- global
-- neovide
if vim.g.neovide then
	-- Put anything you want to happen only in Neovide here
	global.airline_powerline_fonts = 1
	global.neovide_cursor_antialiasing = true
	global.neovide_window_floating_opacity = 0.8
	global.neovide_no_idle = true
	global.neovide_cursor_animation_length = 0.13
	global.neovide_cursor_vfx_particle_density = 10.0
	global.neovide_hide_mouse_when_typing = true
	global.neovide_confirm_quit = true

	global.neovide_cursor_unfocused_outline_width = 0.125
	global.neovide_cursor_vfx_particle_lifetime = 1.2

	global.neovide_refresh_rate = 120
	global.neovide_cursor_vfx_particle_curl = 1.0
	global.neovide_cursor_vfx_particle_density = 7.0
	global.neovide_cursor_vfx_particle_speed = 10.0
	global.neovide_cursor_vfx_particle_phase = 1.5
	global.neovide_cursor_vfx_mode = "railgun"
end

global.luasnippets_path = vim.fn.stdpath("config") .. "/lua/custom/snippets"

vim.diagnostic.config({
	virtual_text = false,
})
