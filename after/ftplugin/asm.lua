local opts = { silent = true, noremap = true, buffer = true }

-- Function to 'make compile'
vim.keymap.set('n', '<leader>cc', ':wa<cr><cmd>!make<cr>', { desc = 'make' })

-- Run the compiled output
vim.keymap.set('n', '<leader>rr', ':!make run<cr>', { desc = 'make run' })

-- Function to 'make clean'
vim.keymap.set('n', '<leader>mc', ':!make clean<cr>', { desc = 'make clean' })

-- Function to 'make gdb'
vim.keymap.set('n', '<leader>mg', ':!make gdb<cr>', { desc = 'make gdb' })

-- Function to 'make tester'
vim.keymap.set('n', '<leader>rt', ':!make tester_c<cr>', { desc = 'make tester_c' })


-- Function to 'formatear con asmfmt'
vim.keymap.set('n', '<leader>lf', ':w<cr><cmd>!asmfmt -w %<cr><cr>', { desc = 'Dar Formato al código' })
