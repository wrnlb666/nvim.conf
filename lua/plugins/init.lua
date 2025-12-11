return {
	-- my plugin start

	-- render-markdown
	{
		"MeanderingProgrammer/render-markdown.nvim",
		-- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
		init = function()
			require("render-markdown").setup({
				enabled = false,
				latex = { enabled = false },
				completions = { lsp = { enabled = true } },
			})
		end,
	},

	-- mdmath
	{
		"Thiago4532/mdmath.nvim",
		lazy = false,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			-- Filetypes that the plugin will be enabled by default.
			filetypes = {},
			-- Color of the equation, can be a highlight group or a hex color.
			-- Examples: 'Normal', '#ff0000'
			foreground = "Normal",
			-- Hide the text when the equation is under the cursor.
			anticonceal = true,
			-- Hide the text when in the Insert Mode.
			hide_on_insert = true,
			-- Enable dynamic size for non-inline equations.
			dynamic = true,
			-- Configure the scale of dynamic-rendered equations.
			dynamic_scale = 1.0,
			-- Interval between updates (milliseconds).
			update_interval = 400,

			-- Internal scale of the equation images, increase to prevent blurry images when increasing terminal
			-- font, high values may produce aliased images.
			-- WARNING: This do not affect how the images are displayed, only how many pixels are used to render them.
			--          See `dynamic_scale` to modify the displayed size.
			internal_scale = 1.0,
		},
	},

	-- multicursor
	{
		"jake-stewart/multicursor.nvim",
		branch = "1.0",
		lazy = false,
		config = function()
			local mc = require("multicursor-nvim")
			mc.setup()
			local set = vim.keymap.set

			-- Add or skip cursor above/below the main cursor.
			set({ "n", "x" }, "<up>", function()
				mc.lineAddCursor(-1)
			end)
			set({ "n", "x" }, "<down>", function()
				mc.lineAddCursor(1)
			end)
			set({ "n", "x" }, "<leader><up>", function()
				mc.lineSkipCursor(-1)
			end)
			set({ "n", "x" }, "<leader><down>", function()
				mc.lineSkipCursor(1)
			end)

			-- Add or skip adding a new cursor by matching word/selection
			set({ "n", "x" }, "<leader>N", function()
				mc.matchAddCursor(1)
			end)
			set({ "n", "x" }, "<leader>S", function()
				mc.matchSkipCursor(1)
			end)

			-- Add and remove cursors with control + left click.
			set("n", "<c-leftmouse>", mc.handleMouse)
			set("n", "<c-leftdrag>", mc.handleMouseDrag)
			set("n", "<c-leftrelease>", mc.handleMouseRelease)

			-- Mappings defined in a keymap layer only apply when there are
			-- multiple cursors. This lets you have overlapping mappings.
			mc.addKeymapLayer(function(layerSet)
				-- Select a different cursor as the main one.
				layerSet({ "n", "x" }, "<left>", mc.prevCursor)
				layerSet({ "n", "x" }, "<right>", mc.nextCursor)

				-- Delete the main cursor.
				layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

				-- Enable and clear cursors using escape.
				layerSet("n", "<esc>", function()
					if not mc.cursorsEnabled() then
						mc.enableCursors()
					else
						mc.clearCursors()
					end
				end)
			end)

			-- Customize how cursors look.
			local hl = vim.api.nvim_set_hl
			hl(0, "MultiCursorCursor", { reverse = true })
			hl(0, "MultiCursorVisual", { link = "Visual" })
			hl(0, "MultiCursorSign", { link = "SignColumn" })
			hl(0, "MultiCursorMatchPreview", { link = "Search" })
			hl(0, "MultiCursorDisabledCursor", { reverse = true })
			hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
			hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
		end,
	},

	-- lazygit
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},

	-- my plugin stop

	-- blink
	{
		import = "nvchad.blink.lazyspec",
	},

	{
		"stevearc/conform.nvim",
		-- event = 'BufWritePre', -- uncomment for format on save
		config = function()
			require("configs.conform")
		end,
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = {},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		-- for markview to work properly
		lazy = false,
		-- dependencies = {
		-- 	"OXY2DEV/markview.nvim",
		-- },
		opts = {
			ensure_installed = {
				"vim",
				"vimdoc",
				"c",
				"python",
				"go",
				"printf",
				"make",
				"lua",
				"dockerfile",
				"markdown",
				"markdown_inline",
				"latex",
				"typst",
				"sql",
				"gitignore",
				"json",
				"yaml",
				"jq",
				"cpp",
				"odin",
				"rust",
				"jsdoc",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
			},
			auto_install = true,
		},
	},
}
