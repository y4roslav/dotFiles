
vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv", vim.cmd.Ex)
vim.keymap.set("n","<leader>k", vim.cmd.bprev)
vim.keymap.set("n","<leader>j", vim.cmd.bnext)
vim.keymap.set("n","<leader>w", vim.cmd.bd)

-- TagBar
vim.keymap.set("n","<leader>tb", vim.cmd.TagbarToggle)

-- RUn Rust Run 
vim.keymap.set("n", "<Leader>rr", vim.cmd.RustRunnables)
