M = {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
}


function M.config()
local harpoon = require 'harpoon'

  -- REQUIRED
  harpoon:setup()
  -- REQUIRED

  vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end, {desc = '[A]dd to Harpoon list'})
  vim.keymap.set('n', '<leader>h', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = '[E]xhibit Harpoon list'})
  vim.keymap.set('n', '<h1>', function() harpoon:list():select(1) end,{desc = '[H]arpoon [1]'})
  vim.keymap.set('n', '<C-2>', function() harpoon:list():select(2) end)
  vim.keymap.set('n', '<C-3>', function() harpoon:list():select(3) end)
  vim.keymap.set('n', '<C-4>', function() harpoon:list():select(4) end)

  -- Toggle previous & next buffers stored within Harpoon list
  vim.keymap.set('n', '<C-S-P>', function() harpoon:list():prev() end, {desc = 'Previous Buffer'})
  vim.keymap.set('n', '<C-S-N>', function() harpoon:list():next() end, {desc = 'Next Buffer'})
end
--
return M
