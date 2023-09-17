-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Add favorite colorschema and style
    use 'navarasu/onedark.nvim'
    --
    -- Add visualisation for buffers
    -- using packer.nvim
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

    -- Fuzzy finder over lists 
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Add File Browser 
    use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }

    -- Better language syntax
    use ({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})

    -- Toggle Terminal 
    use {"akinsho/toggleterm.nvim", tag = '*'}
    
    -- Rust specific packages 
    -- ---------------------- --
    use 'williamboman/mason.nvim'  -- LSP, debbugers, linters 
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig' 
    use 'simrat39/rust-tools.nvim' -- Automatically set up lspconfig

     -- Completion framework:
    use 'hrsh7th/nvim-cmp' 

    -- LSP completion source:
    use 'hrsh7th/cmp-nvim-lsp'

    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'                             
    use 'hrsh7th/cmp-path'                              
    use 'hrsh7th/cmp-buffer'                            
    use 'hrsh7th/vim-vsnip'                             

    -- Extra 
    use {'folke/trouble.nvim', requires = 'nvim-tree/nvim-web-devicons' }

    use 'preservim/tagbar' 
    
    use 'tigion/nvim-asciidoc-preview'

    end)
