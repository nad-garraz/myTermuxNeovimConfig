local M = {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', lazy = true },
  },
}

function M.config()
  local icons = require 'user.icons'
  local actions = require 'telescope.actions'

  require('telescope').setup {
    defaults = {
      prompt_prefix = icons.ui.Telescope .. ' ',
      selection_caret = icons.ui.Forward .. ' ',
      entry_prefix = '   ',
      initial_mode = 'insert',
      selection_strategy = 'reset',
      path_display = { 'smart' },
      color_devicons = true,
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--hidden',
        '--glob=!.git/',
      },

      mappings = {
        i = {
          ['<C-n>'] = actions.cycle_history_next,
          ['<C-p>'] = actions.cycle_history_prev,

          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,
        },
        n = {
          ['<esc>'] = actions.close,
          ['j'] = actions.move_selection_next,
          ['k'] = actions.move_selection_previous,
          ['q'] = actions.close,
        },
      },
    },
    pickers = {
      live_grep = {
        theme = 'dropdown',
      },

      grep_string = {
        theme = 'dropdown',
      },

      find_files = {
        theme = 'dropdown',
        previewer = false,
      },

      buffers = {
        theme = 'dropdown',
        previewer = false,
        initial_mode = 'normal',
        mappings = {
          i = {
            ['<C-d>'] = actions.delete_buffer,
          },
          n = {
            ['dd'] = actions.delete_buffer,
          },
        },
      },

      planets = {
        show_pluto = true,
        show_moon = true,
      },

      colorscheme = {
        enable_preview = true,
      },

      lsp_references = {
        theme = 'dropdown',
        initial_mode = 'normal',
      },

      lsp_definitions = {
        theme = 'dropdown',
        initial_mode = 'normal',
      },

      lsp_declarations = {
        theme = 'dropdown',
        initial_mode = 'normal',
      },

      lsp_implementations = {
        theme = 'dropdown',
        initial_mode = 'normal',
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
      },
    },
  }

  -- See `:help telescope.builtin`
  local builtin = require 'telescope.builtin'
  local wk = require 'which-key'

  -- vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })

  wk.add {
    {
      '<leader>sh',
      builtin.help_tags,
      desc = '[S]earch [H]elp',
    },
    { '<leader>sk', builtin.keymaps, desc = '[S]earch [K]eymaps' },
    { '<leader>sf', builtin.find_files, desc = '[S]earch [F]iles' },
    { '<leader>ss', builtin.builtin, desc = '[S]earch [S]elect Telescope' },
    { '<leader>sw', builtin.grep_string, desc = '[S]earch current [W]ord' },
    { '<leader>sg', builtin.live_grep, desc = '[S]earch by [G]rep' },
    { '<leader>sd', builtin.diagnostics, desc = '[S]earch [D]iagnostics' },
    { '<leader>sr', builtin.resume, desc = '[S]earch [R]esume' },
    { '<leader>s.', builtin.oldfiles, desc = '[S]earch Recent Files ("." for repeat)' },
    { '<leader>sch', builtin.commands, desc = '[S]earch [C]ommands History' },
    { '<leader><leader>', builtin.buffers, desc = '[ ] Find existing buffers' },
    {
      '<leader>sn',
      function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[S]earch [N]eovim files',
    },
    -- Grep with current buffer's git root directory as CWD.
    {
      '<leader>sgr',
      function()
        local currentBufDir = require('mis_cosas.myUtils').get_buf_dir()
        local original_cwd = vim.fn.getcwd() -- Directorio original para luego volver
        vim.cmd.cd(currentBufDir) -- Cambio de directorio para ejecutar telescope
        local git_root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
        -- Si el comando no dio error entonces el directorio va a ser git root
        local search_dir = (vim.v.shell_error == 0 and git_root) or original_cwd
        builtin.live_grep { cwd = search_dir }
        vim.cmd.cd(original_cwd) -- Cambio de directorio para volver
      end,
      desc = '[S]earch [G]rep Git [R]oot',
    },
    { '<leader>sc', builtin.colorscheme, desc = '[C]olorscheme' },
    { '<leader>sgs', builtin.git_status, desc = '[g]it [s]tatus' },
    { '<leader>sgf', builtin.git_files, desc = '[g]it [f]iles' },
    { '<leader>sgc', builtin.git_commits, desc = '[g]it [c]ommits' },
  }
end

return M
