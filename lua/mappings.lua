require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

-- save
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


-- Swapping 'za' with 'zA'
vim.api.nvim_set_keymap('n', 'za', 'zA', {noremap = true})
-- vim.api.nvim_set_keymap('n', 'zA', 'za', {noremap = true})

-- -- Swapping 'zr' with 'zR'
-- vim.api.nvim_set_keymap('n', 'zr', 'zR', {noremap = true})
-- vim.api.nvim_set_keymap('n', 'zR', 'zr', {noremap = true})
--
-- -- Swapping 'zm' with 'zM'
-- vim.api.nvim_set_keymap('n', 'zm', 'zM', {noremap = true})
-- vim.api.nvim_set_keymap('n', 'zM', 'zm', {noremap = true})


-- git branches
vim.api.nvim_set_keymap('n', '<leader>co', '<cmd>Telescope git_branches<CR>', {noremap = true, silent = true})

-- D to delete
vim.api.nvim_set_keymap('v', 'D', '"_d', {noremap = true})


-- multi-line j/k
vim.api.nvim_set_keymap('n', 'j', 'gj', {noremap = true})
vim.api.nvim_set_keymap('n', 'k', 'gk', {noremap = true})

