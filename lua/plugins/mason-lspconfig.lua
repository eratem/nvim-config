local opts = {
	ensure_installed = {
		-- "efm",
		"bashls",
		"pylsp",
		"lua_ls",
		"jsonls",
		"clangd",
	},

	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
