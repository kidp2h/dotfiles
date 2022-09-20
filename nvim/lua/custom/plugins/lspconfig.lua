local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "cssls", "emmet_ls", "clangd", "tailwindcss" }
local navicServers = { "tsserver", "sumneko_lua", "html", "jsonls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

for _, lsp in ipairs(navicServers) do
  lspconfig[lsp].setup {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      require("nvim-navic").attach(client, bufnr)
    end,
    capabilities = capabilities,
  }
end
