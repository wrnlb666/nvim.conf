require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
map("i", "jk", "<cmd>w<cr><ESC>")

-- save
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


-- Swapping 'za' with 'zA'
map('n', 'za', 'zA', {noremap = true})
-- vim.api.nvim_set_keymap('n', 'zA', 'za', {noremap = true})

-- -- Swapping 'zr' with 'zR'
-- vim.api.nvim_set_keymap('n', 'zr', 'zR', {noremap = true})
-- vim.api.nvim_set_keymap('n', 'zR', 'zr', {noremap = true})
--
-- -- Swapping 'zm' with 'zM'
-- vim.api.nvim_set_keymap('n', 'zm', 'zM', {noremap = true})
-- vim.api.nvim_set_keymap('n', 'zM', 'zm', {noremap = true})


-- git branches
map('n', '<leader>co', '<cmd>Telescope git_branches<CR>', {noremap = true, silent = true})

-- D to delete
map("v", "D", "\"_d", {noremap = true})


-- multi-line j/k
map("n", "j", "gj")
map("n", "k", "gk")

