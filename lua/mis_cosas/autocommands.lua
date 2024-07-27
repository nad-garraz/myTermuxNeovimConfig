-- No agreagar comentario después de apretar enter
vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
  callback = function()
    vim.cmd 'set formatoptions-=cro'
  end,
})

-- Si el archivo es .tex, le fuerzo setfiletyp = tex
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead' }, {
  pattern = '*.tex',
  callback = function()
    vim.bo.filetype = 'tex'
  end,
})

-- Si el archivo es .tex, le fuerzo setfiletyp = tex
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead' }, {
  pattern = '*.rem',
  callback = function()
         local dir = require "mis_cosas.myUtils".get_buf_dir()
        vim.fn.chdir(dir)
  end,
})

