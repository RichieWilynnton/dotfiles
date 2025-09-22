return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "fixjson",
            "clang-format",
            "clangd",
            "cmake-language-server",
            "gitleaks",
            "json-lsp",
            "jsonlint",
            "lua-language-server",
            "ocamlformat",
            "python-lsp-server",
        },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    config = function()
        vim.keymap.set('n', '<C-]>', vim.lsp.buf.definition, { desc = "Go to Definition (LSP)" })
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        require("lspconfig").clangd.setup({
            capabilities = capabilities,
            on_attach = function(client, _)
                client.server_capabilities.documentFormattingProvider = false
            end,
        })
        -- Configure Lua LSP
        require("lspconfig").lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })
        require("lspconfig").pyright.setup({
            capabilities = capabilities,
        })
    end,
}
