local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "emmet_ls", "clangd", "jsonls", "tsserver", "tailwindcss", "graphql", "eslint" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
}
