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




-- -- Run the compiled output
-- vim.keymap.set('n', '<leader>rr', ':!make run<cr>', { desc = 'make run' })
--
-- -- Function to 'make clean'
-- vim.keymap.set('n', '<leader>mc', ':!make clean<cr>', { desc = 'make clean' })
--
-- -- Function to 'make gdb'
-- vim.keymap.set('n', '<leader>mg', ':!make gdb<cr>', { desc = 'make gdb' })
--
-- -- Function to 'make tester'
-- vim.keymap.set('n', '<leader>mt', ':!make tester_script<cr>', { desc = 'make tester' })
--
-- -- Function to 'make tester'
-- vim.keymap.set('n', '<leader>mv', ':!make valgrind<cr>', { desc = 'make valgrind' })
