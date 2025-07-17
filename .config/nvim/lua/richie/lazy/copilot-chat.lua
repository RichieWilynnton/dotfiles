return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- github one is for vim
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      model = "claude-sonnet-4",  -- Set default model here
      mappings = {
        reset = {
          normal = '<C-n>',
          insert = '<C-n>'
        }
      }
    },
  },
}
