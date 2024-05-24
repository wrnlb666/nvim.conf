-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "bufls", "pyright", "zls", "omnisharp", "rust_analyzer", "kotlin_language_server", "jdtls", }

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

-- gopls
lspconfig.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- go/templ
lspconfig.templ.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
        "templ",
        "lsp",
    },
}

-- htmx
lspconfig.htmx.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
        "html", "templ"
    },
}

-- typescript
lspconfig.tsserver.setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
}
