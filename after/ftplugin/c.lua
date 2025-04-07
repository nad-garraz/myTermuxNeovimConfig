local opts = { silent = true, noremap = true, buffer = true }

-- Run the compiled output
vim.keymap.set('n', '<leader>rr', function()
  local file = vim.fn.expand '%:r'
  local cmd = string.format('./%s', file)

  vim.cmd 'botright new'
  local buf = vim.api.nvim_get_current_buf()
  local chan_id = vim.fn.termopen(cmd, {
    on_exit = function(_, exit_code)
      if exit_code ~= 0 then
        vim.api.nvim_buf_set_lines(buf, -1, -1, false, { '', 'Program exited with code: ' .. exit_code })
      end
    end,
  })
  -- vim.cmd 'startinsert'
end, opts)

-- Function to run 'make'
vim.keymap.set('n', '<leader>m', function()
  vim.cmd.write { bang = true }
  local cmd = 'make'
vim.cmd.lcd(require 'mis_cosas.myUtils'.get_buf_dir())
  vim.fn.jobstart(cmd, {
    on_exit = function(_, exit_code)
      if exit_code ~= 0 then
        vim.notify('Error compiling ' .. cmd, vim.log.levels.ERROR)
      end
    end,
  })
end, opts)

-- Function to run 'make clean'
vim.keymap.set('n', '<leader>mc', function()
  vim.cmd.write { bang = true }
  local cmd = 'make clean'
vim.cmd.lcd(require 'mis_cosas.myUtils'.get_buf_dir())
  vim.fn.jobstart(cmd, {
    on_exit = function(_, exit_code)
      if exit_code ~= 0 then
        vim.notify('Error compiling ' .. cmd, vim.log.levels.ERROR)
      end
    end,
  })
end, opts)
