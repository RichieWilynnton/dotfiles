return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                python = { "black" },
                cpp = { "clang_format" },
            },
        })
        vim.keymap.set({ "n", "v" }, "<leader>lf", function()
            require("conform").format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            })
        end, { desc = "Format file or range (conform)" })
    end,
}
