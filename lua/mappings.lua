require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "jj", "<cmd>w<cr><ESC>")

-- save
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


-- Swapping 'za' with 'zA'
map('n', 'za', 'zA', {noremap = true})


-- NvChad menu
-- mouse
map("n", "<RightMouse>", function()
    vim.cmd.exec '"normal! \\<RightMouse>"'

    local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
    require("menu").open(options, { mouse = true })
end, {})


-- markview
map("n", "<leader>m", ":Markview splitToggle<CR>", { desc = "Markview: toggle split preview" })

-- MdMath
vim.b.mdmath = false
map("n", "<leader>M", function()
    on = vim.b.mdmath
    if on then
        pcall(vim.cmd, "MdMath disable")
    else
        pcall(vim.cmd, "MdMath enable")
    end
    vim.b.mdmath = not on
end, { desc = "MdMath: Toggle MdMath" })


-- git branches
map('n', '<leader>co', '<cmd>Telescope git_branches<CR>', {noremap = true, silent = true})

-- D to delete
map("v", "D", "\"_d", {noremap = true})


-- multi-line j/k
map("n", "j", "gj")
map("n", "k", "gk")

