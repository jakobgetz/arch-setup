local on_attach = require "plugins.configs.lspconfig".on_attach
local capabilites = require "plugins.configs.lspconfig".capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
local servers = { "tsserver", "html", }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilites = capabilites,
  }
end

lspconfig.rust_analyzer.setup({
  cmd = { "rustup", "run", "stable", "rust-analyzer" },
  filetypes = { "rust" },
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
})
