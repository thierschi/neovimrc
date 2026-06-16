vim.pack.add({
  { 
    src = "https://github.com/hrsh7th/nvim-cmp",
    version = "main",
    name = "NVIM Cmp"
  },
  {
    src = "https://github.com/hrsh7th/cmp-nvim-lsp",
    version = "main",
    name = "NVIM Cmp LSP"
  },
})

local cmp = require("cmp")

cmp.setup({
  completion = {
    autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
  },

  snippet = {
    expand = function(args)
      -- no snippet engine for now
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  }),

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
  }),
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("clangd", {
  capabilities = capabilities,
})

vim.lsp.config("pyright", {
  capabilities = capabilities,
})
