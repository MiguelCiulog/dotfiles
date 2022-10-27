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
    use {'neoclide/coc.nvim', branch = 'release'}

    -- Manage buffers on tab
    use "tiagovla/scope.nvim"

    -- Windows
    use "anuvyklack/windows.nvim"
    use "anuvyklack/middleclass"

end)
