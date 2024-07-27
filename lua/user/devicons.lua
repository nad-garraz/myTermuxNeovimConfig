local M = {
	'nvim-tree/nvim-web-devicons',
	event = "VeryLazy",
	enabled = vim.g.have_nerd_font
}

function M.config()
	require "nvim-web-devicons"
end

return M
