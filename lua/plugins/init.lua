return {
    -- my plugin start
    {
        'Exafunction/codeium.vim',
        event = 'BufEnter',
        config = function()
            -- change default accept key to `ctrl+z`
            vim.keymap.set(
                'i', '<C-z>',
                function()
                    return vim.fn['codeium#Accept']()
                end,
                {
                    expr = true,
                    silent = true
                }
            )
        end,
    },

    -- my plugin stop


    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        config = function()
        require "configs.conform"
        end,
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },

    {
    	"williamboman/mason.nvim",
    	opts = {
    		ensure_installed = {
                "clangd",
                "gopls",
                "pyright",
                "templ",
                "buf-language-server",
                "omnisharp",
                "gdtoolkit",
                "zls",
                "texlab",
                "prettier",
                "lua-language-server",
                "typescript-language-server",
                "stylua",
    			"html-lsp",
                "htmx-lsp",
                "css-lsp",
                "sqls",
    		},
    	},
    },

    {
    	"nvim-treesitter/nvim-treesitter",
    	opts = {
    		ensure_installed = {
    		    "vim",
                "vimdoc",
                "c",
                "python",
                "go",
                "templ",
                "proto",
                "printf",
                "c_sharp",
                "make",
                "lua",
                "markdown",
                "latex",
                "sql",
                "gitignore",
                "gdscript",
                "gdshader",
                "godot_resource",
                "jq",
                "cpp",
                "zig",
                "jsdoc",
                "javascript",
                "typescript",
                "html",
                "css",
    		},
            auto_install = true,
    	},
    },
}
