-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
    "gopls",
    "templ",
    "bufls",
    "pyright",
    "gdscript",
    "zls",
    "htmx",
    "texlab",
    "sqls",
    "tsserver",
    "html",
    "cssls",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    }
end

-- clangd
lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
        "--malloc-trim",
        "--pch-storage=memory",
        "--clang-tidy",
        -- "--pretty",
    },
    filetypes = {
        "c",
        "cpp",
        "objc",
        "objcpp",
        "cuda",
    },
}

-- omnisharp
lspconfig.omnisharp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
        "omnisharp",
    },
}
