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

-- lsp signiture
require("lsp_signature").setup({
    bind = true,
    hint_enable = false,
    floating_window = true,
    fix_pos = true,
    hint_prefix = " ",
    handler_opts = {
        border = "rounded",
    },
})

vim.diagnostic.config({
    virtual_text = {
        enable = true,
        source = "always",
        spacing = 4,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

vim.lsp.inlay_hint.enable = true
