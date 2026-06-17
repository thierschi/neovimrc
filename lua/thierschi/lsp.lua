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

local diag_float_win = nil

-- Show diagnostics on hover
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    if diag_float_win and vim.api.nvim_win_is_valid(diag_float_win) then
      vim.api.nvim_win_close(diag_float_win, true)
    end

    local _, win = vim.diagnostic.open_float(nil, {
      focus = false,
      scope = "cursor",
    })

    diag_float_win = win
  end,
})

-- Close the float when moving / switching buffers
vim.api.nvim_create_autocmd({ "CursorMoved", "BufLeave", "InsertEnter", "WinLeave" }, {
  callback = function()
    if diag_float_win and vim.api.nvim_win_is_valid(diag_float_win) then
      vim.api.nvim_win_close(diag_float_win, true)
      diag_float_win = nil
    end
  end,
})

vim.o.updatetime = 300
