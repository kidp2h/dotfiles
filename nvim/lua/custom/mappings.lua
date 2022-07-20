local M = {}

M.BufLine = {
  n = {
    ["<leader>1"] = {"<cmd> BufferLineGoToBuffer 1 <CR>", "Go to buffer 1"},
    ["<leader>2"] = {"<cmd> BufferLineGoToBuffer 2 <CR>", "Go to buffer 2"},
    ["<leader>3"] = {"<cmd> BufferLineGoToBuffer 3 <CR>", "Go to buffer 3"},
    ["<leader>4"] = {"<cmd> BufferLineGoToBuffer 4 <CR>", "Go to buffer 4"},
    ["<leader>5"] = {"<cmd> BufferLineGoToBuffer 5 <CR>", "Go to buffer 5"},
    ["<leader>6"] = {"<cmd> BufferLineGoToBuffer 6 <CR>", "Go to buffer 6"},
    ["<leader>7"] = {"<cmd> BufferLineGoToBuffer 7 <CR>", "Go to buffer 7"},
    ["<leader>8"] = {"<cmd> BufferLineGoToBuffer 8 <CR>", "Go to buffer 8"},
    ["<leader>9"] = {"<cmd> BufferLineGoToBuffer 9 <CR>", "Go to buffer 9"},
  }
}
M.SaveFile = {
  i = {
    ["<C-s>"] = {"<ESC>:w<cr>", "Save file in insert mode"}
  }
}
M.PreventArrow = {
  n = {
    ["<up>"] = {"<nop>", "Don't use arrow"},
    ["<down>"] = {"<nop>", "Don't use arrow"},
    ["<right>"] = {"<nop>", "Don't use arrow"},
    ["<left>"] = {"<nop>", "Don't use arrow"},
  },
  i = {
    ["<up>"] = {"<nop>", "Don't use arrow"},
    ["<down>"] = {"<nop>", "Don't use arrow"},
    ["<right>"] = {"<nop>", "Don't use arrow"},
    ["<left>"] = {"<nop>", "Don't use arrow"},
  }
}
return M
