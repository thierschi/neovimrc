vim.pack.add({
  {
    src = "https://github.com/neovim/nvim-lspconfig",
    version = "master",
    name = "LSP Config",
  }
})

-- LSP: enable servers
vim.lsp.enable("clangd")   -- C/C++
vim.lsp.enable("pyright")  -- Python

-- LSP keymaps (when attached)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  end,
})

-- Diagnostics
vim.diagnostic.config({
  virtual_text = {
    spacing = 2,
    prefix = "|",
    severity = { min = vim.diagnostic.severity.WARN },
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  float = {
    border = "rounded",
  },
})

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

-- Navigate errors
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

-- Auto popup on hover
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})
