local M = {
	"williamboman/mason-lspconfig.nvim",
	dependencies = { -- dependencias. Solo se instala mason-lspconfig, si mason está instalado
		"williamboman/mason.nvim",
	},
}

function M.config()
	local servers = {
		-- "lua_ls",
		"pyright",
		-- "clangd",
		"marksman",
		-- "texlab",
		"bashls",
	}

	require("mason").setup({
		ui = {
			border = "rounded",
		},
	})

	require("mason-lspconfig").setup({
		ensure_installed = servers,
	})
end

return M
