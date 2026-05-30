-- nvim tree automatic behavior
require("nvim-tree").setup({
	filters = { dotfiles = false },
	disable_netrw = true,
	hijack_cursor = true,
	sync_root_with_cwd = true,

	on_attach = function(bufnr)
		local api = require("nvim-tree.api")
		api.map.on_attach.default(bufnr)
		-- Swap d and D
		vim.keymap.set("n", "d", api.fs.trash, {
			buffer = bufnr,
			noremap = true,
			silent = true,
			desc = "Trash",
		})
		vim.keymap.set("n", "D", api.fs.remove, {
			buffer = bufnr,
			noremap = true,
			silent = true,
			desc = "Delete Permanently",
		})
	end,

	update_focused_file = {
		enable = true,
	},
	view = {
		width = 30,
		preserve_window_proportions = true,
	},
	renderer = {
		root_folder_label = false,
		highlight_git = "all",
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

-- close nvim-tree automatically
vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
			vim.cmd("quit")
		end
	end,
})
