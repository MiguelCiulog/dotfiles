-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Themes
	use("rebelot/kanagawa.nvim")
	use("ellisonleao/gruvbox.nvim")

	-- Top line
	use("romgrk/barbar.nvim")

	-- Bottom line :)
	use("nvim-lualine/lualine.nvim")

	-- Better matching
	use({
		"andymass/vim-matchup",
		setup = function()
			-- may set any options here
			vim.g.matchup_matchparen_offscreen = { method = "status" }
		end,
	})

	-- Language package
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-context")

	-- Comments
	use("numToStr/Comment.nvim")

	-- For Telescope (Plenary.nvim)
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")

	-- for file icons
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")

	-- Sudo support
	use("lambdalisue/suda.vim")

	-- Transparent
	use("xiyaowong/nvim-transparent")

	-- LSP
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})

	use({
		"nvimdev/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
		},
	})

	-- Easier lsp config
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- DAP
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	use("nvim-neotest/nvim-nio")

	use("leoluz/nvim-dap-go")
	use("mfussenegger/nvim-dap-python")

	-- Auto-completion
	use("hrsh7th/cmp-buffer") -- Cmp source for buffer words
	use("hrsh7th/cmp-path") -- Cmp source for path
	use("hrsh7th/cmp-nvim-lua") -- Cmp source for nvim lua
	use("saadparwaiz1/cmp_luasnip") -- Luasnip completion source

	-- null-ls
	use("nvimtools/none-ls.nvim")

	-- Snippets plugin
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- VSCode like pictograms on completion
	use("onsails/lspkind.nvim")

	-- Manage buffers on tab
	use("tiagovla/scope.nvim")

	-- Windows
	use("anuvyklack/windows.nvim")
	use("anuvyklack/middleclass")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Automatic documentation
	use("danymat/neogen")
end)
