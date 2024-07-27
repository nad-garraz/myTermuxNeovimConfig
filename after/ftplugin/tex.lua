-- Función encargada de encontrar el archivo indicado para compilar
-- en directorios padres del archivo actual.
local function find_main_tex_file(start_dir)
  -- Busco los archivos tex, que tengan: begin{document} y end{document}
  -- input: string, output: bool
  local function contains_document_environment(file_path)
    local content = table.concat(vim.fn.readfile(file_path), '\n')
    return string.match(content, '\\begin{document}.*\\end{document}')
  end

  local function dfs_search(dir)
    local tex_files = vim.fn.globpath(dir, '*.tex', false, true)
    for _, file in ipairs(tex_files) do
      if contains_document_environment(file) then
        return file
      end

      local parent_dir = vim.fn.fnamemodify(dir, ':h')
      local result = dfs_search(parent_dir)
      if result then
        return result
      end
    end
  end
  return dfs_search(start_dir)
end

local function async_compilation(file_name)
  local function compile()
    local cmd = { 'pdflatex', '-interaction=nonstopmode', file_name }
    vim.fn.jobstart(cmd, {
      on_stderr = function(_, data)
        if data then
          vim.schedule(function()
            vim.notify(table.concat(data, '\n'), vim.log.levels.ERROR)
          end)
        end
      end,
      on_exit = function(_, exit_code)
        if exit_code ~= 0 then
          vim.schedule(function()
            vim.notify('PDF compilation successful', vim.log.levels.INFO)
          end)
        else
          vim.schedule(function()
            vim.notify('PDF compilation failed', vim.log.levels.ERROR)
          end)
        end
      end,
    })
  end

  -- Run compilation twice
  compile()
  vim.defer_fn(compile, 1000) -- Run second compilation after 1 second
end

-- -- Run pdflatex asynchronously
-- local function async_compilation(file_name)
--   vim.system { 'pdflatex', file_name }
--   vim.system { 'pdflatex', file_name }
-- end

local function compile_latex()
  -- Save the current buffer
  vim.cmd.write()

  -- Get the current file's full path
  local current_dir = vim.fn.expand '%:p:h'

  -- Agarro el archivo que tengo que compilar
  local main_file = find_main_tex_file(current_dir)

  if main_file then
    -- get directorio del archivo a compilar
    local main_dir = vim.fn.fnamemodify(main_file, ':h')
    vim.cmd.lcd(main_dir) -- Voy al directorio a compilar
    local nombre_archivo = vim.fn.fnamemodify(main_file, ':t')
    async_compilation(nombre_archivo)
  else
    print 'No encontré el TeX con \\begin{document}....'
  end

  -- Change back to the current file's directory
  vim.cmd.lcd(current_dir)
end

local function open_pdf()
  -- Get the current file's full path
  local current_dir = vim.fn.expand '%:p:h'

  -- Agarro el archivo que tengo que compilar
  local main_file = find_main_tex_file(current_dir)

  if main_file then
    -- get directorio del archivo a compilar
    local main_dir = vim.fn.fnamemodify(main_file, ':h')
    -- vim.cmd('lcd ' .. main_dir) -- Voy al directorio del archivo que se compiló
    vim.cmd.lcd(main_dir) -- Voy al directorio donde está el PDF
    local nombre_pdf = vim.fn.fnamemodify(main_file, ':r') .. '.pdf'
    -- Open PDF file
    vim.fn.jobstart({ 'termux-open', nombre_pdf }, {
      on_exit = function(_, exit_code)
        if exit_code == 0 then
          print('Opening: ' .. nombre_pdf .. '.')
        else
          print('There was an error: ' .. exit_code)
        end
        vim.cmd.lcd(vim.fn.fnamemodify(current_dir, ':h'))
      end,
    })
  end
end

-- Set up the keymap
vim.keymap.set('n', '<leader>cc', compile_latex, {
  buffer = true,
  desc = 'Compile LaTeX file',
})

-- Set up the keymap
vim.keymap.set('n', '<leader>rr', open_pdf, {
  buffer = true,
  desc = 'Opening ' .. vim.fn.expand '%:b:r' .. '.pdf',
})

--
vim.keymap.set('i', '$$', '$$<++><ESC>"9F$i', {
  buffer = true,
  silent = true,
})

-- Format Latex file with latexindent
-- En termux no funciona directo de los paquetes de texlive, hay que instalar también:
-- pkg install perl
-- cpan App::cpanminus
-- cpanm YAML::Tiny
-- cpanm File::HomeDir

local CONFIG_FILE = vim.fn.expand '~/.config/nvim/.latexindent.yaml'
local LATEXINDENT_CMD = '/data/data/com.termux/files/usr/bin/texlive/latexindent'


local function texFormat()
  -- Check if latexindent is available
  if vim.fn.executable(LATEXINDENT_CMD) ~= 1 then
    vim.notify('latexindent is not available', vim.log.levels.ERROR)
    return
  end

  -- Check if config file exists
  if vim.fn.filereadable(CONFIG_FILE) ~= 1 then
    vim.notify('latexindent config file not found', vim.log.levels.WARN)
    -- Proceed anyway, latexindent will use default settings
  end

  -- Save the buffer
  vim.cmd 'update'

  -- Format the file
  local formatCommand = string.format('%s -m -l %s -w "%s"', LATEXINDENT_CMD, CONFIG_FILE, vim.fn.expand '%:p')
  local output = vim.fn.system(formatCommand)

  if vim.v.shell_error == 2 then
    vim.notify('Formatting failed: ' .. output, vim.log.levels.ERROR)
  else
    vim.notify('Formatting successful', vim.log.levels.INFO)
    -- Reload the buffer to show changes
    vim.cmd 'edit!'
  end
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'tex',
  callback = function()
    vim.keymap.set('n', '<leader>lf', texFormat, {
      desc = '[L]atex [F]ormat',
      buffer = true,
    })
  end,
})
