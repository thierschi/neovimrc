vim.pack.add({
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        version = "main"
    },
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
        version = "main"
    }
})

require("nvim-treesitter").setup({})
require("nvim-treesitter").install({
    "c",
    "python",
    "lua"
})
