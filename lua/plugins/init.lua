return {
    -- my plugin start

    -- codeium
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
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
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
                "kotlin",
                "dart",
                "dockerfile",
                "nix",
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
            auto_install = false,
    	},
    },
}
