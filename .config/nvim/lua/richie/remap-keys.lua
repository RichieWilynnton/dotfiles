vim.g.mapleader = " "

vim.keymap.set('n', '<leader>gg', ':CopilotChatToggle<CR>', { noremap = true, silent = true })

-- Center the cursor always
vim.keymap.set('n', 'k', 'kzz', { noremap = true })
vim.keymap.set('n', 'j', 'jzz', { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })

-- make esc run :noh 
vim.keymap.set('n', '<Esc>', ':noh<CR>', { noremap = true, silent = true })
