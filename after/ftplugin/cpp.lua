local mainname = vim.fn.expand '%:t:r'

-- Function to 'make compile'
vim.keymap.set('n', '<leader>cc', function()
    vim.cmd 'wa'
    vim.cmd('!make MAINNAME=' .. mainname)
end, { desc = 'make', silent = true })

-- Run the compiled output
vim.keymap.set('n', '<leader>rr', function()
    vim.cmd('silent !make run MAINNAME=' .. mainname)
end, { desc = 'make run' })

-- Run the compiled output
vim.keymap.set('n', '<leader>ms', function()
    vim.cmd('!make setup MAINNAME=' .. mainname)
end, { desc = 'make setup' })

-- Function to 'make clean'
vim.keymap.set('n', '<leader>mc', ':!make clean<cr>', { desc = 'make clean' })

-- Function to 'make gdb'
vim.keymap.set('n', '<leader>gdb', function()
    vim.cmd('silent !make gdb MAINNAME=' .. mainname)
end, {desc = "GDB"}
)

-- Function to 'make test'
vim.keymap.set('n', '<leader>mt', function()
    vim.cmd 'wa'
    vim.cmd('silent !make test MAINNAME=' .. mainname)
end, { desc = 'make test' })

-- Format with clang-format
vim.keymap.set('n', '<leader>lf', function()
    vim.cmd 'wa'
    vim.cmd('silent !make format FILE=' .. vim.fn.expand '%') -- Le pasa el archivo que estoy editando al Makefile
end, {
    desc = 'Format with clang-format',
    buffer = true,
    silent = true,
})
