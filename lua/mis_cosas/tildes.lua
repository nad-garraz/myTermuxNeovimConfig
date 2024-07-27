Tildes = {}

--Tildes
-- Initialize toggleVariable
TILDESOn = 0
-- Shorten function name
local keymap = vim.keymap.set
local delmap = vim.keymap.del
-- Silent keymap option
local opts = { silent = true }

--Mapping keys
local function tildes()
  TILDESOn = 1
  keymap('i', '[a', 'á', opts)
  keymap('i', '[A', 'Á', opts)
  keymap('i', '[e', 'é', opts)
  keymap('i', '[E', 'É', opts)
  keymap('i', '[i', 'í', opts)
  keymap('i', '[I', 'Í', opts)
  keymap('i', '[o', 'ó', opts)
  keymap('i', '[O', 'Ó', opts)
  keymap('i', '[u', 'ú', opts)
  keymap('i', '[U', 'Ú', opts)
  keymap('i', '{u', 'ü', opts)
  keymap('i', '[n', 'ñ', opts)
  keymap('i', '[N', 'Ñ', opts)
  keymap('i', '??', '¿', opts)
  keymap('i', '!!', '¡', opts)
end

-- Unmapping keys
local function tildesOff()
  TILDESOn = 0
  delmap('i', '[a', opts)
  delmap('i', '[A', opts)
  delmap('i', '[e', opts)
  delmap('i', '[E', opts)
  delmap('i', '[i', opts)
  delmap('i', '[I', opts)
  delmap('i', '[o', opts)
  delmap('i', '[O', opts)
  delmap('i', '[u', opts)
  delmap('i', '[U', opts)
  delmap('i', '{u', opts)
  delmap('i', '[n', opts)
  delmap('i', '[N', opts)
  delmap('i', '??', opts)
  delmap('i', '!!', opts)
end

-- Toggle functionality
function Tildes.toggle()
  if TILDESOn == 0 then
    tildes()
--    print 'Tildes on'
  else
    tildesOff()
  --  print 'Tildes off'
  end
end

return Tildes
