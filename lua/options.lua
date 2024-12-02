require("nvchad.options")

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- insert behavior
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

local sysname = vim.loop.os_uname().sysname

if sysname == "Linux" then
	vim.opt.clipboard = "unnamedplus"
elseif sysname == "Windows_NT" then
	vim.opt.clipboard = "unnamed"
elseif sysname == "Darwin" then
	vim.opt.clipboard = "unnamedplus"
end

-- default shell
-- vim.opt.shell = 'zsh'
if sysname == "Linux" then
	vim.opt.shell = "zsh"
elseif sysname == "Windows_NT" then
	vim.o.shell = "powershell"
	vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
	vim.o.shellquote = ""
	vim.o.shellxquote = ""
elseif sysname == "Darwin" then
	vim.opt.shell = "zsh"
end

-- treesitter fold
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	command = "normal! zR",
})

-- disable Codeium by default
vim.g.codeium_enabled = false

-- nvim tree automatic behavior
require("nvim-tree").setup({
	filters = { dotfiles = false },
	disable_netrw = true,
	hijack_cursor = true,
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = false,
	},
	view = {
		width = 30,
		preserve_window_proportions = true,
	},
	renderer = {
		root_folder_label = false,
		highlight_git = true,
		indent_markers = { enable = true },
		icons = {
			glyphs = {
				default = "󰈚",
				folder = {
					default = "",
					empty = "",
					empty_open = "",
					open = "",
					symlink = "",
				},
				git = { unmerged = "" },
			},
		},
	},
	actions = {
		remove_file = {
			close_window = false,
		},
	},
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	nested = true,
	callback = function(data)
		-- buffer is a real file on the disk
		local real_file = vim.fn.filereadable(data.file) == 1
		-- buffer is a [No Name]
		local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

		if not real_file and not no_name then
			-- only files please
			require("nvim-tree.api").tree.open({ focus = true })
		elseif real_file then
			-- real file
			require("nvim-tree.api").tree.toggle({ focus = false })
		else
			require("nvim-tree.api").tree.toggle({ focus = true })
		end

		-- setup exit autocmd
		vim.api.nvim_create_autocmd("BufEnter", {
			nested = true,
			callback = function()
				if #vim.api.nvim_list_wins() == 1 and vim.bo.filetype == "NvimTree" then
					vim.cmd("quit")
				end
			end,
		})
	end,
})

-- line break
vim.wo.linebreak = true

-- add `.templ` file extension
vim.filetype.add({
	extension = {
		templ = "templ",
		proto = "proto",
	},
})
