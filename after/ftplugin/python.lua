local mainname = vim.fn.expand '%:t:r'

-- Function to 'make run'
vim.keymap.set('n', '<leader>rr', function()
    vim.cmd 'wa'
    vim.cmd('silent !make MAINNAME=' .. mainname)
end, { desc = 'make run', silent = true })

-- Format with black
vim.keymap.set('n', '<leader>lf', function()
    vim.cmd 'wa'
    vim.cmd('silent !make format FILE=' .. vim.fn.expand '%') -- Le pasa el archivo que estoy editando al Makefile
end, {
    desc = 'Format with Black',
    buffer = true,
    silent = true,
})
