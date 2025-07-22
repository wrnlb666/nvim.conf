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


-- NvChad menu
-- mouse
vim.keymap.set("n", "<RightMouse>", function()
    vim.cmd.exec '"normal! \\<RightMouse>"'

    local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
    require("menu").open(options, { mouse = true })
end, {})


-- markview
vim.keymap.set("n", "<leader>m", ":Markview toggle<CR>", { desc = "Markview: toggle preview" })


-- git branches
map('n', '<leader>co', '<cmd>Telescope git_branches<CR>', {noremap = true, silent = true})

-- D to delete
map("v", "D", "\"_d", {noremap = true})


-- multi-line j/k
map("n", "j", "gj")
map("n", "k", "gk")

