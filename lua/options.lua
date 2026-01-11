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
	o.shell = os.getenv("SHELL")
elseif sysname == "Windows_NT" then
	o.shell = "powershell"
	o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
	o.shellquote = ""
	o.shellxquote = ""
elseif sysname == "Darwin" then
	o.shell = os.getenv("SHELL")
end

-- treesitter fold
-- o.foldmethod = "expr"
-- o.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	pattern = "*",
-- 	command = "normal! zR",
-- })

-- line break
vim.wo.linebreak = true

-- gf to open file in correct location
vim.api.nvim_create_autocmd("TermOpen", {
	callback = function(args)
		local opts = { buffer = args.buf, silent = true, noremap = true }
		vim.keymap.set("n", "gf", function()
			local file = vim.fn.expand("<cfile>")
			if file == "" then
				return
			end
			vim.cmd("wincmd p")
			vim.cmd("edit " .. vim.fn.fnameescape(file))
		end, opts)
	end,
})

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

-- within some filetypes, tab should indent 2 spaces only
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"html",
		"css",
        "json",
		"dart",
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
	},
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})
