local mainname = vim.fn.expand '%:t:r'

-- Function to 'make build-compile'
vim.keymap.set('n', '<leader>cc', function()
    vim.cmd 'wa'
    vim.cmd('!make MAINNAME=' .. mainname)
end, { desc = 'make copile ', silent = true })

-- Run the compiled output
vim.keymap.set('n', '<leader>rr', function()
    vim.cmd 'wa'
    vim.cmd('silent !make run')
end, { desc = 'make run' })

-- Correr en intérprete
vim.keymap.set('n', '<leader>ii', function()
    vim.cmd 'wa'
    vim.cmd('silent !make interprete FILE=' .. vim.fn.expand '%')
end, { desc = 'make interprete' })

-- Format with fourmolu
vim.keymap.set('n', '<leader>lf', function()
    vim.cmd 'wa'
    vim.cmd('silent!make format FILE=' .. vim.fn.expand '%') -- Le pasa el archivo que estoy editando al Makefile
end, {
    desc = 'Format with fourmolu',
    buffer = true,
})

-- Function to 'make help'
vim.keymap.set('n', '<leader>hh', function()
    vim.cmd('!make help')
end, { desc = 'make help ', silent = true })

-- Clean
vim.keymap.set('n', '<leader>mc', function()
    vim.cmd('!make clean')
end, { desc = 'make clean' })
