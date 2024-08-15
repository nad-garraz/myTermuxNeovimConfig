local opts = { silent = true, noremap = true, buffer = true }

-- Run the compiled output
vim.keymap.set('n', '<leader>rr', function()
  local file = vim.fn.expand '%:r'
  local cmd = string.format('java %s', file)

  vim.cmd 'botright new' -- buffer open terminal a la derecha
  local buf = vim.api.nvim_get_current_buf()
  local chan_id = vim.fn.termopen(cmd, {
    on_exit = function(_, exit_code)
      if exit_code ~= 0 then
        vim.api.nvim_buf_set_lines(buf, -1, -1, false, { '', 'Program exited with code: ' .. exit_code })
      end
    end,
  })
end, opts)


-- Function to run 'java'
vim.keymap.set('n', '<leader>cc', function()
  vim.cmd.write { bang = true }
  local file = vim.fn.expand '%'
  local cmd = string.format('javac %s', file)
  vim.cmd.lcd(require('mis_cosas.myUtils').get_buf_dir())
  vim.fn.jobstart(cmd, {
    on_exit = function(_, exit_code)
      if exit_code ~= 0 then
        vim.notify('Error compiling ' .. cmd, vim.log.levels.ERROR)
      end
    end,
  })
end, opts)
