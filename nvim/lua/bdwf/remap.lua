
vim.g.mapleader = " "
-- dissable netrw in favor neovim-tree
-- vim.keymap.set("n","<leader>pv", vim.cmd.Ex)
vim.keymap.set("n","<leader>k", vim.cmd.bprev)
vim.keymap.set("n","<leader>j", vim.cmd.bnext)
vim.keymap.set("n","<leader>w", vim.cmd.bd)

-- neovim-tree
local api = require "nvim-tree.api"
local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

vim.keymap.set("n","<leader>ft", vim.cmd.NvimTreeToggle)
vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- TagBar
vim.keymap.set("n","<leader>tb", vim.cmd.TagbarToggle)

-- Run Rust Run 
vim.keymap.set("n", "<Leader>rr", vim.cmd.RustRunnables)

-- Rust Debud(DAP)
vim.keymap.set('n', '<leader>dt', ':DapToggleBreakpoint<CR>')
vim.keymap.set('n', '<leader>dx', ':DapTerminate<CR>')
vim.keymap.set('n', '<leader>do', ':DapStepOver<CR>')
