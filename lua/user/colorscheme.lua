local M = {
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false, -- laod at startup
    priority = 1000, -- loads before the rest of plugins
  },
  {
    'iruzo/matrix-nvim',
    lazy = false, -- laod at startup
    priority = 1000, -- loads before the rest of plugins
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = false, -- laod at startup
    priority = 1000, -- loads before the rest of plugins
  },
}

function M.config()
  -- vim.api.nvim_command 'colorscheme matrix-nvim'
  -- vim.api.nvim_command 'colorscheme cyberdream'
  -- vim.api.nvim_command 'colorscheme kanagawa-dragon'
end

return M
