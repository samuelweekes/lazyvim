return {
	-- Ruby/Rails support
	{
		"vim-ruby/vim-ruby",
		ft = { "ruby", "eruby" },
	},
	{
		"tpope/vim-rails",
		ft = { "ruby", "eruby" },
	},
	{
		"tpope/vim-endwise",
		ft = { "ruby", "eruby" },
	},
	-- Better ERB support
	{
		"RRethy/nvim-treesitter-endwise",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter.configs").setup({
				endwise = {
					enable = true,
				},
			})
		end,
	},
}