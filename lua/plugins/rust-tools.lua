return {
	{
		"simrat39/rust-tools.nvim",
		opts = function(_, _)
			local rt = require("rust-tools")
			rt.setup({
				server = {
					on_attach = function(_, bufnr)
						vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
						vim.keymap.set("n", "<Leader>ca", rt.code_action.code_ation_group, { buffer = bufnr })
					end,
				},
			})
		end

	},
}
