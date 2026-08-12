-- Compile LaTeX using Makefile
vim.keymap.set('n', '<leader>cc', function()
    vim.cmd 'cd %:h'
    vim.cmd 'wa'
    vim.cmd 'silent !latexmake compile'
end, {
    desc = 'Compile LaTeX',
    buffer = true,
    silent = true,
})

--  Open PDF
vim.keymap.set('n', '<leader>rr', function()
    vim.cmd 'cd %:h'
    vim.cmd 'silent !latexmake run'
end, {
    desc = 'Compile and open PDF',
    buffer = true,
    silent = true,
})

-- Clean auxiliary files
vim.keymap.set('n', '<leader>mc', function()
    vim.cmd 'cd %:h'
    vim.cmd 'w'
    vim.cmd ':!latexmake clean-all'
end, {
    desc = 'Clean aux files',
    buffer = true,
})

-- Format current LaTeX buffer, haciendo un write previo para que no
-- moleste el que se haya modificado el buffer
vim.keymap.set('n', '<leader>lf', function()
    local current_file = vim.fn.expand '%:p'
    vim.cmd 'w'
    vim.cmd 'cd %:h'
    vim.cmd('!latexmake format FILE=' .. vim.fn.shellescape(current_file))
end, {
    desc = 'Format current LaTeX file',
    buffer = true,
})

vim.keymap.set('i', '$$', '$$<++><ESC>F$i')
