return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "github/copilot.vim" },
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        build = "make tiktoken",                            -- Only on MacOS or Linux
        opts = {
            model = "gpt-4.1",                               -- Set default model here
            mappings = {
                reset = {
                    normal = '<C-n>',
                    insert = '<C-n>'
                }
            }
        },
    },
}
