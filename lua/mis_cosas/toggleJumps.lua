--Modulos Jumps, para prender y apagar los saltos
Jumps = {}

-- Initialize toggleVariable
local jumpsOn = 0

--Mapping keys
local function jumps()
  jumpsOn = 1
  vim.keymap.set('i', '()', '()<++><ESC>F)i' )
  vim.keymap.set('i', '[]', '[]<++><ESC>F]i' )
  vim.keymap.set('i', '{}', '{}<++><ESC>F}i' )
  vim.keymap.set('i', '""', '""<++><ESC>F"i' )
  vim.keymap.set('i', "''", "''<++><ESC>F'i" )
  vim.keymap.set('i', '<>', '<><++><ESC>F>i' )
end

-- Unmapping keys
local function jumpsOff()
  jumpsOn = 0
  vim.keymap.del('i', '()')
  vim.keymap.del('i', '[]')
  vim.keymap.del('i', '{}')
  vim.keymap.del('i', '""')
  vim.keymap.del('i', "''")
  vim.keymap.del('i', '<>')
end

-- Toggle functionality
function Jumps.toggle()
  if jumpsOn == 0 then
    jumps()
 --   print 'Jumps on'
  else
    jumpsOff()
--    print 'Jumps off'
  end
end

return Jumps
