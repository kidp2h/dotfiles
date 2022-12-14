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
global.airline_powerline_fonts = 1
global.neovide_cursor_antialiasing = true
global.neovide_window_floating_opacity = 0.8
global.neovide_no_idle = true
global.neovide_cursor_animation_length = 0.13
global.neovide_cursor_vfx_particle_density = 10.0
global.neovide_hide_mouse_when_typing = true
global.neovide_confirm_quit = true

global.luasnippets_path = vim.fn.stdpath("config") .. "/lua/custom/snippets"

vim.diagnostic.config({
	virtual_text = false,
})
