local M = {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-emoji',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    {
      'L3MON4D3/LuaSnip',
      dependencies = {
        'rafamadriz/friendly-snippets',
      },
    },
    'hrsh7th/cmp-nvim-lua',
  },
}

function M.config()
  local cmp = require 'cmp'
  local luasnip = require 'luasnip'
  require('luasnip/loaders/from_vscode').lazy_load()

  local icons = require 'user.icons'

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert {
      ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
      ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-e>'] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },
      ['<C-y>'] = cmp.mapping.confirm { select = true },
    },
    formatting = {
      fields = { 'kind', 'abbr', 'menu' },
      format = function(entry, vim_item)
        if icons and icons.kind then
          vim_item.kind = string.format('%s %s', icons.kind[vim_item.kind] or '', vim_item.kind)
        end
        vim_item.menu = ({
          nvim_lsp = '[LSP]',
          luasnip  = '[Snippet]',
          buffer   = '[Buffer]',
          path     = '[Path]',
          nvim_lua = '[Lua]',
        })[entry.source.name]
        return vim_item
      end,
    },
    sources = {
      { name = 'nvim_lsp', priority = 1000 },
      { name = 'luasnip', priority = 750, keyword_length = 2 },
      { name = 'nvim_lua', priority = 500, keyword_length = 2 },
      {
        name = 'buffer',
        priority = 250,
        keyword_length = 2,
        option = {
          get_bufnrs = function()
            local bufs = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              bufs[vim.api.nvim_win_get_buf(win)] = true
            end
            return vim.tbl_keys(bufs)
          end,
        },
      },
      { name = 'path', priority = 250, keyword_length = 3 },
      { name = 'emoji', priority = 100, keyword_length = 2 },
    },
    sorting = {
      priority_weight = 2,
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        cmp.config.compare.locality,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    window = {
      completion = {
        border = 'rounded',
        scrollbar = false,
      },
      documentation = {
        border = 'rounded',
      },
    },
    experimental = {
      ghost_text = false,
    },
  }
end

return M
