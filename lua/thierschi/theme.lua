vim.pack.add({
	{
		src = "https://github.com/rose-pine/neovim",
		name = "rose-pine",
	},
})
require("rose-pine").setup()

vim.pack.add({
	{
		src = "https://github.com/tomasr/molokai",
		name = "molokai",
	},
})


vim.cmd("colorscheme molokai")
