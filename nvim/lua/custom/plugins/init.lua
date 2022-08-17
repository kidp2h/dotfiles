return {
  -- autoclose tags in html, jsx etc
  ["windwp/nvim-ts-autotag"] = {
    ft = { "html", "javascriptreact" },
    after = "nvim-treesitter",
    config = function()
      require("custom.plugins.smolconfigs").autotag()
    end,
  },

  -- format & linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- minimal modes
  ["Pocco81/TrueZen.nvim"] = {
    cmd = {
      "TZAtaraxis",
      "TZMinimalist",
      "TZFocus",
    },
    config = function()
      require "custom.plugins.truezen"
    end,
  },

  -- get highlight group under cursor
  ["nvim-treesitter/playground"] = {
    cmd = "TSCaptureUnderCursor",
    config = function()
      require("nvim-treesitter.configs").setup()
    end,
  },

  -- dim inactive windows
  ["andreadev-it/shade.nvim"] = {
    module = "shade",
    config = function()
      require("custom.plugins.smolconfigs").shade()
    end,
  },

  ["Pocco81/AutoSave.nvim"] = {
    module = "autosave",
    config = function()
      require("custom.plugins.smolconfigs").autosave()
    end,
  },

  -- notes stuff
  ["nvim-neorg/neorg"] = {
    ft = "norg",
    after = "nvim-treesitter",
    config = function()
      require "custom.plugins.neorg"
    end,
  },

  ["goolord/alpha-nvim"] = {
    disable = false,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["tpope/vim-surround"] = {},
  ["mattn/emmet-vim"] = {},
  ["terryma/vim-multiple-cursors"] = {},
  ["wakatime/vim-wakatime"] = {},
  ["folke/trouble.nvim"] = {
    config = function()
      require "custom.plugins.trouble"
    end,
  },
  ["folke/todo-comments.nvim"] = {
    config = function()
      require "custom.plugins.todo-comments"
    end,
  },
  ["romgrk/barbar.nvim"] = {},
  ["tpope/vim-fugitive"] = {},
  ["junegunn/gv.vim"] = {},
  ["rcarriga/nvim-notify"] = {
    config = function()
      require "custom.plugins.notify"
    end,
  },
  ["andweeb/presence.nvim"] = {},
  ["phaazon/hop.nvim"] = {
    config = function()
      require("hop").setup {}
    end,
  },
}
