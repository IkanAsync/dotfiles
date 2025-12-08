return {
	{
		"folke/tokyonight.nvim",
		-- lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			require("themery").setup({
				themes = { "tokyonight", "tokyonight-storm" },
				livePreview = true,
			})
		end,
	},
}
