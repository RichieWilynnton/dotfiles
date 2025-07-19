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
            "ocamlformat"
        },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    config = function()
        vim.keymap.set('n', '<C-]>', vim.lsp.buf.definition, { desc = "Go to Definition (LSP)" })
        vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { buffer = bufnr, desc = "Format code" })
        -- Enable LSP capabilities (for autocompletion)
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Configure clangd
        require("lspconfig").clangd.setup({
            capabilities = capabilities,
            on_attach = function(client, _)
                client.server_capabilities.documentFormattingProvider = true
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
    end,
}
