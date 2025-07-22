require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup({
  ensure_installed = { "clangd", "rust_analyzer" },
})

-- Setup LSP servers
local lspconfig = require("lspconfig")

-- Rust
lspconfig.rust_analyzer.setup({})

-- C++
lspconfig.clangd.setup({})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").clangd.setup {
    capabilities = capabilities,
}
