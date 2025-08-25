local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = {
	"gopls",
	"golangci_lint_ls",
	"pyright",
	"ruff",
	"autotools_ls",
	"cmake",
	"bashls",
	"sqls",
	"html",
	"cssls",
	"ts_ls",
	"eslint",
    "stylelint_lsp",
	"tailwindcss",
	-- "omnisharp",
	-- "rust_analyzer",
	-- "zls",
	-- "ols",
	-- "dockerls",
	-- "docker_compose_language_service",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
	})
end

-- clangd
lspconfig.clangd.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
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
