vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'user.launch'
require 'user.keymaps'
require 'user.options'
require 'user.netrw'
spec 'user.colorscheme'
spec 'user.devicons'
spec 'user.treesitter'
spec 'user.mason'
spec 'user.lspconfigTermux'
spec 'user.cmp'
spec 'user.none-ls'
spec 'user.whichkey'
spec 'user.harpoon'
spec 'user.telescope'
spec 'user.neogit'

-- Lazy installer
require 'user.lazy'

-- Nerd font
vim.g.have_nerd_font = true

-- Mis cosas
require 'mis_cosas.autocommands'
require 'mis_cosas.tildes'
require 'mis_cosas.toggleJumps'
require 'mis_cosas.my'
require 'mis_cosas.myUtils'
require 'snippets.latex_snips'

-- -- color
vim.cmd.colorscheme 'matrix'
