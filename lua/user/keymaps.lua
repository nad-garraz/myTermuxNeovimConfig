-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', { desc = 'Resize' })
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', { desc = 'Resize' })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Resize' })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Resize' })

vim.keymap.set('n', '<S-l>', ':bnext<CR>', { desc = 'Go to next Buffer' }) -- Navigate buffers
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', { desc = 'Go to previous Buffer' }) -- Navigate buffers
vim.keymap.set('n', '<S-q>', ':w<cr><cmd>bdelete!<CR>', { desc = 'Save and close current Buffer ' }) -- Save and Close current buffer

vim.keymap.set('n', '<ESC>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Go to normal mode
vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode' , silent = true, noremap = true })
vim.keymap.set('i', 'kj', '<ESC>', { desc = 'Exit insert mode' , silent = true, noremap = true })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Toggle WRAP
vim.keymap.set('n', '<leader>tw', ':set invwrap<CR>', { silent = true, desc = 'Toggle WRAP text' })

-- SPELL CHECKING
vim.keymap.set('n', '\\eng', ':setlocal spell! spelllang=en_us<CR>', { desc = 'English spelling set' })
vim.keymap.set('n', '\\esp', ':setlocal spell! spelllang=es_ar<CR>', { desc = 'Español spelling set' })

-- Tildes
vim.keymap.set('n', '<leader>tt', '<CMD> lua Tildes.toggle() <CR>', { desc = 'Toggle tildes con "["  mode on' })

-- Jumps mother fucker!
vim.keymap.set('i', '<c-j>', '<esc>/<+.*+><cr>:noh<cr><esc>"9cf>', { desc = '[j]ump to <+_+>', silent = true, noremap = true })
vim.keymap.set('n', '<leader>jj', '<cmd> lua Jumps.toggle() <CR>',{ desc = '[j]umps toggle', silent = true})

-- Yo mama
vim.keymap.set('n', 'ym', '<CMD>lua My_shit.pete()<CR>', { desc = 'Yo - mama...!' })

-- Visual
vim.keymap.set("v", "<", "<gv", {desc = "Stay in visual indentation"})
vim.keymap.set("v", ">", ">gv", {desc = "Stay in visual indentation"})

-- Better paste
vim.keymap.set('x', 'p', '[["_dP]]', { desc = 'Better Paste' , noremap = true })

-- Substitute visual selected
vim.keymap.set('v', '<leader>ss', '"hy:%s/<c-r>h//gc<left><left><left>', { desc = 'Substitute selected text' })
vim.keymap.set('n', '<leader>sw', "viw\"hy:%s/<c-r>=expand('<cword>')<cr>//gc<left><left><left>", { desc = 'Substitute word under cursor text' })


-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set('t', '<ESC><ESC>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
