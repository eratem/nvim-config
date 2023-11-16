return {
	'voldikss/vim-floaterm',
	vim.keymap.set("n", "<leader>ft", vim.cmd.FloatermToggle, { desc = "[f]loaterm[t]oggle" }),
	vim.keymap.set("n", "<leader>fN", vim.cmd.FloatermNew, { desc = "[f]loaterm[N]ew" }),
	vim.keymap.set("n", "<leader>fn", vim.cmd.FloatermNext, { desc = "[f]loaterm[n]ext" }),
	lazy = false,
}
