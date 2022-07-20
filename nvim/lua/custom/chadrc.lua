-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "chadracula",
   theme_toggle = { "chadracula" , "gruvchad" },
   statusline = {
      separator_style = "round"
   },
   transparency = true
}
M.plugins = {
   user = {
      ["jose-elias-alvarez/null-ls.nvim"] = {
         after = "nvim-lspconfig",
         config = function()
            require "custom.plugins.null-ls"
         end,
      },
      ["windwp/nvim-ts-autotag"] = {
         ft = { "html", "javascriptreact", "typescript", "javascript", "jsx", "tsx", "php" },
         after = "nvim-treesitter",
         config = function()
            local present, autotag = pcall(require, "nvim-ts-autotag")
            if present then
               autotag.setup()
            end
         end,
      },
      ['dense-analysis/ale'] = {},
      ['goolord/alpha-nvim'] = {
         disable = false
      },
      ['tpope/vim-surround'] = {},
      ['mattn/emmet-vim'] = {},
      ["terryma/vim-multiple-cursors"] = {}

   },
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig"
      }
   },
   override = {
     ["kyazdani42/nvim-tree.lua"] = {
       git = {
         enable = true
       },
       view = {
         side = "left",
         width = 35
       },
       renderer = {
         highlight_git = true,
         icons = {
           show = {
             git = true
           }
         }
       }
     },
     ["NvChad/nvterm"] = {
       terminals = {
         type_opts = {
           float = {
             border = "double"
           }
         }
       }
     }
   }
}

M.mappings = require "custom.mappings"
return M
