local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = {
	"gopls",
	"golangci_lint_ls",
	"pyright",
	"ruff",
	"bashls",
	"omnisharp",
	"zls",
	"ols",
	"dockerls",
	"docker_compose_language_service",
	"sqls",
	"ts_ls",
	"html",
	"tailwindcss",
	"cssls",
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

-- rust_analyzer
lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				enable = false,
			},
			assist = {
				importGranularity = "module",
				importMergeBehavior = "last",
				importPrefix = "by_self",
			},
			cargo = {
				loadOutDirsFromCheck = true,
			},
			procMacro = {
				enable = true,
			},
			completion = {
				autoimport = {
					enable = true,
				},
				addCallArgumentSnippets = true,
				postfix = {
					enable = true,
				},
			},
			-- Optional: Enable inlay hints for better context
			inlayHints = {
				chainingHints = true,
				parameterHints = true,
				typeHints = true,
			},
		},
	},
})
