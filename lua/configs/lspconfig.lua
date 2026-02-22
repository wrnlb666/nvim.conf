local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = {
	"clangd",
	"gopls",
	"golangci_lint_ls",
	"pyright",
	"ruff",
	"just",
	"autotools_ls",
	"cmake",
	"bashls",
	"sqls",
	"html",
	"cssls",
	"ts_ls",
	"eslint",
	"dartls",
	"jsonls",
	"stylelint_lsp",
	"tailwindcss",
	"rust_analyzer",
	"jdtls",
	-- "dockerls",
	-- "docker_compose_language_service",
}

-- customize configs

-- clangd
vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
		"--function-arg-placeholders=0",
		"--clang-tidy",
		"--malloc-trim",
		"--completion-style=detailed",
	},
	filetypes = {
		"c",
		"cpp",
		"objc",
		"objcpp",
		"cuda",
	},
})

-- lsps with default config
vim.lsp.enable(servers)
