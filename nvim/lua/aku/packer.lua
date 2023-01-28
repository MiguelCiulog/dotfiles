-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'rebelot/kanagawa.nvim'

    -- Top line
    use {'akinsho/bufferline.nvim', tag = "v2.*"}

    -- Bottom line :)
    use 'nvim-lualine/lualine.nvim'

    -- Language package
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'lukas-reineke/indent-blankline.nvim'

    -- Comments
    use 'numToStr/Comment.nvim'

    -- For Telescope (Plenary.nvim)
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    -- for file icons
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    -- Sudo support
    use 'lambdalisue/suda.vim'

    -- Transparent
    use 'xiyaowong/nvim-transparent'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use {
        "glepnir/lspsaga.nvim",
        commit = 'b7b4777369b441341b2dcd45c738ea4167c11c9e'
    }

    -- Easier lsp config
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"

    -- DAP
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'

    use 'leoluz/nvim-dap-go'
    use 'mfussenegger/nvim-dap-python'

    -- Autocompletion plugin
    use "hrsh7th/nvim-cmp"

    -- Auto-completion
    use "hrsh7th/cmp-buffer"       -- Cmp source for buffer words
    use "hrsh7th/cmp-path"         -- Cmp source for path
    use "hrsh7th/cmp-nvim-lsp"     -- Cmp source for LSP client
    use "hrsh7th/cmp-nvim-lua"     -- Cmp source for nvim lua
    use "saadparwaiz1/cmp_luasnip" -- Luasnip completion source

    -- null-ls
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Snippets plugin
    use 'L3MON4D3/LuaSnip'

    -- VSCode like pictograms on completion
    use 'onsails/lspkind.nvim'

    -- Manage buffers on tab
    use "tiagovla/scope.nvim"

    -- Windows
    use "anuvyklack/windows.nvim"
    use "anuvyklack/middleclass"

    -- Git
    use 'lewis6991/gitsigns.nvim'

    -- Windows
    use 'wesQ3/vim-windowswap'

    -- Multiple cursors
    use 'mg979/vim-visual-multi'
end)
