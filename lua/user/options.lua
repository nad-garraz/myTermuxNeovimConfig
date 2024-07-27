-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

vim.opt.number = true -- Make line numbers default
vim.opt.relativenumber = true -- relative line numbers
vim.opt.mouse = 'a' -- Enable mouse mode, can be useful for resizing splits
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.pumblend = 10
vim.opt.breakindent = true -- Enable break indent
vim.opt.undofile = true -- Save undo history
vim.opt.tabstop = 4 -- insert 4 spaces for a tab
vim.opt.laststatus = 3 -- 3 -> only the last window will always have a status line
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim. See `:help 'clipboard'`
vim.opt.cmdheight = 1 -- more space in the neovim command line
vim.opt.conceallevel = 0 -- So that is visible in markdown files
vim.opt.breakindent = true -- Enable break indent
vim.opt.undofile = true -- Save undo history
vim.opt.ignorecase = true
vim.opt.smartcase = true -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.signcolumn = 'yes' -- Keep signcolumn on by default
vim.opt.updatetime = 250 -- Decrease update time
vim.opt.timeoutlen = 300 -- Decrease mapped sequence wait time. Displays which-key popup sooner
vim.opt.wrap = false -- No wrap
vim.opt.sidescrolloff=10

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

vim.opt.cursorline = true -- Show which line your cursor is on

vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true

vim.g.netrw_banner = 0
vim.g.netrw_mouse = 2


-- Arranco con los jumps on
require 'mis_cosas.tildes'.toggle()
require 'mis_cosas.toggleJumps'.toggle()
