local M = {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
}

function M.config()
  local null_ls = require 'null-ls'
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup {
    on_attach = function(client, bufnr)
      print('Null-ls attached to buffer', bufnr, 'with filetype', vim.bo[bufnr].filetype)
    end,
    debug = true,
    sources = {
      formatting.stylua,
      formatting.prettier.with{
      extra_files = {'*.md'},
      },
      formatting.black,
      formatting.clang_format.with {
        command = 'clang-format',
        extra_args = {
          '--style={'
            .. 'AlignConsecutiveAssignments: {Enabled: true, AlignCompound: true, AcrossEmptyLines: false, AcrossComments: false}, '
            .. 'AlignConsecutiveDeclarations: {Enabled: true, AcrossEmptyLines: false, AcrossComments: false}, '
            .. 'AllowShortCaseLabelsOnASingleLine: true, '
            .. 'AllowShortFunctionsOnASingleLine: true, '
            .. 'AllowShortIfStatementsOnASingleLine: Always, '
            .. 'BraceWrapping: {SplitEmptyFunction: false}, '
            .. 'BreakBeforeBraces: Allman, '
            .. 'BreakBeforeTernaryOperators: true, '
            .. 'BreakConstructorInitializers: BeforeComma, '
            .. 'ColumnLimit: 100, '
            .. 'IndentCaseLabels: false, '
            .. 'IndentWidth: 4, '
            .. 'PackConstructorInitializers: Never, '
            .. 'ReflowComments: false, '
            .. 'UseTab: Never'
            .. '}',
        },
      },
      null_ls.builtins.completion.spell,
      -- formatting.prettier.with {
      --   extra_filetypes = { "toml" },
      --   -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      -- },
      -- formatting.eslint,
    },
  }
end

return M
