-- No agreagar comentario después de apretar enter
vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
    callback = function()
        vim.cmd 'set formatoptions-=cro'
    end,
})

-- -- Si el archivo es .tex, le fuerzo setfiletyp = tex
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.tex',
  callback = function()
    vim.bo.filetype = 'tex'
  end,
})
--
-- -- Si el archivo es .tex, le fuerzo setfiletyp = tex
-- vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
--   pattern = '*.rem',
--   callback = function()
--     local dir = require('mis_cosas.myUtils').get_buf_dir()
--     vim.fn.chdir(dir)
--   end,
-- })

-- dunstrc reset
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('DemoniosActivos', { clear = true }),
    pattern = 'dunstrc',
    callback = function()
        vim.fn.system 'killall dunst && dunst &'
        print 'dunst restarteado'
    end,
})

-- sxhkd reset
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('DemoniosActivos', { clear = true }),
    pattern = 'sxhkdrc',
    callback = function()
        vim.fn.system 'killall sxhkd && sxhkd &'
        print 'sxhkd restarteado'
    end,
})

vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('FortuneQuotes', { clear = true }),
    pattern = 'mis_quotes',
    callback = function()
        local dir = vim.fn.expand '$HOME_LOCAL' .. '/quotes/'
        local cmd = 'strfile ' .. dir .. 'mis_quotes ' .. dir .. 'mis_quotes.dat'
        vim.fn.system(cmd)
        print 'Fortune DB actualizada'
    end,
})
