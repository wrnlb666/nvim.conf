return {
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
                "zls",
                "omnisharp",
                "texlab",
                "prettier",
                "lua-language-server",
                "typescript-language-server",
                "stylua",
    			"html-lsp",
                "htmx-lsp",
                "css-lsp",
                "ols",
                "sqls",
                "jdtls",
                "rust-analyzer",
    		},
    	},
    },

    {
    	"nvim-treesitter/nvim-treesitter",
    	opts = {
    		ensure_installed = {
    		    "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
                "c",
                "printf",
                "gitignore",
                "make",
                "python",
                "go",
                "templ",
                "proto",
                "markdown",
                "latex",
                "sql",
                "java",
                "jq",
                "cpp",
                "c_sharp",
                "zig",
                "odin",
                "rust",
                "kotlin",
                "jsdoc",
                "javascript",
                "typescript",
    		},
    	},
    },
}
