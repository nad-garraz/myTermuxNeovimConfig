local mainname = vim.fn.expand '%'

local function map_key(key, cmd, desc)
  vim.keymap.set('n', key, function()
    vim.cmd 'cd %:h'
    vim.cmd 'wa'
    vim.cmd(cmd)
  end, { silent = false, noremap = true, buffer = true, desc = desc })
end

vim.keymap.set('n', '<leader>rr', function()
  vim.cmd 'wa'
  vim.cmd('silent !make run-node FILE=' .. mainname)
end, {
  desc = 'make run node',
  buffer = true,
  silent = true,
})

-- Format with prettier
vim.keymap.set('n', '<leader>lf', function()
  vim.cmd 'wa'
  vim.cmd('silent !make format FILE=' .. mainname) -- Le pasa el archivo que estoy editando al Makefile
end, {
  desc = 'Format with Prettier',
  buffer = true,
  silent = true,
})

map_key('<leader>mc', ':!make clean', 'make clean')
