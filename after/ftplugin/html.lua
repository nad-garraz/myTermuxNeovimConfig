-- local mainname = vim.fn.expand '%:t:r'

-- Format with tidy
vim.keymap.set('n', '<leader>lf', function()
    vim.cmd 'wa'
    vim.cmd('silent !make format FILE=' .. vim.fn.expand '%') -- Le pasa el archivo que estoy editando al Makefile
end, {
    desc = 'Format with Tidy',
    buffer = true,
    silent = true,
})
