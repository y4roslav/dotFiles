-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Add favorite colorschema and style
    use "EdenEast/nightfox.nvim"
    use 'freddiehaddad/feline.nvim'
    use 'folke/tokyonight.nvim'
    
    -- Fuzzy finder over lists 
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Language interfaces and LSP
    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    end)
