require("nvchad.options")
require("opt-nvim-tree")

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- insert behavior
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.smarttab = true
o.expandtab = true
o.autoindent = true
o.smartindent = true

local sysname = vim.loop.os_uname().sysname

if sysname == "Linux" then
	o.clipboard = "unnamedplus"
elseif sysname == "Windows_NT" then
	o.clipboard = "unnamed"
elseif sysname == "Darwin" then
	o.clipboard = "unnamedplus"
end

-- default shell
-- o.shell = 'zsh'
if sysname == "Linux" then
	o.shell = "zsh"
elseif sysname == "Windows_NT" then
	o.shell = "powershell"
	o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
	o.shellquote = ""
	o.shellxquote = ""
elseif sysname == "Darwin" then
	o.shell = "zsh"
end

-- treesitter fold
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	command = "normal! zR",
})

-- disable Codeium by default
vim.g.codeium_enabled = false

-- line break
vim.wo.linebreak = true

-- filetype
vim.filetype.add({
	extension = {
		templ = "templ",
		proto = "proto",
	},
})

-- set filetype for docker compose
vim.api.nvim_create_autocmd("BufRead", {
	pattern = { "docker-compose.yml", "docker-compose.yaml" },
	callback = function()
		vim.bo.filetype = "yaml.docker-compose"
	end,
})

-- in html and css, tab should indent 2 spaces only
vim.api.nvim_create_autocmd("BufRead", {
	callback = function()
		local ft = vim.bo.filetype
		if ft == "html" or ft == "css" then
			vim.bo.tabstop = 2
			vim.bo.shiftwidth = 2
			vim.bo.softtabstop = 2
		end
	end,
})
