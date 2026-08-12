local function map_key(key, cmd, desc)
    vim.keymap.set('n', key, function()
  vim.cmd 'cd %:h'
  vim.cmd 'wa'
  vim.cmd(cmd)
  end, { silent = false, noremap = true, buffer = true, desc = desc }
  )
  end

map_key('<leader>cc', ':!make compile', 'make compile')
map_key('<leader>cd', ':!make compile-d', 'make compile-d')
map_key('<leader>rr', ':!make run', 'make run')
map_key('<leader>rd', ':!make run-d', 'make run-d')
map_key('<leader>mc', ':!make clean', 'make clean')
