require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "jj", "<cmd>w<cr><ESC>")

-- save
map({ "i", "n", "v" }, "<C-s>", "<cmd> w <cr>")

-- Swapping 'za' with 'zA'
-- map('n', 'za', 'zA', {noremap = true})

-- NvChad menu
-- mouse
map({ "n" }, "<RightMouse>", function()
	vim.cmd.exec('"normal! \\<RightMouse>"')

	local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
	require("menu").open(options, { mouse = true })
end, {})

-- minty Huefy color picker
map({ "n" }, "<leader>cp", function()
	local huefy = require("minty.huefy")
	huefy.open()
end, { desc = "minty Huefy color picker" })

-- markview
-- map("n", "<leader>m", ":Markview splitToggle<CR>", { desc = "Markview: toggle split preview" })

-- markview
map("n", "<leader>m", require("render-markdown").buf_toggle, { desc = "render-markdown: toggle Buf view" })

-- MdMath
vim.b.mdmath = false
map("n", "<leader>M", function()
	local on = vim.b.mdmath
	if on then
		pcall(function()
			vim.cmd("MdMath disable")
		end)
	else
		pcall(function()
			vim.cmd("MdMath enable")
		end)
	end
	vim.b.mdmath = not on
end, { desc = "MdMath: Toggle MdMath" })

-- git branches
map("n", "<leader>co", "<cmd>Telescope git_branches<CR>", { noremap = true, silent = true })

-- D to delete
map("v", "D", '"_d', { noremap = true })

-- multi-line j/k
map("n", "j", "gj")
map("n", "k", "gk")
