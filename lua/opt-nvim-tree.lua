require("nvchad.options")

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

-- open nvim-tree automatically
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


