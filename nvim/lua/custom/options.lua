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
opt.guifont = { "CaskaydiaCove Nerd Font", ":h11" }
opt.foldcolumn = "2"
opt.foldlevel = 0 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true
opt.fillchars = [[eob: ,vert: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- global
global.airline_powerline_fonts = 1
global.neovide_cursor_antialiasing = true
global.neovide_transparency = 0.5
global.neovide_no_idle = true
global.neovide_cursor_animation_length = 0.13
global.neovide_cursor_vfx_particle_density = 10.0
global.neovide_hide_mouse_when_typing = true
