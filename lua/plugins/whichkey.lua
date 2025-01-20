return {
	"folke/which-key.nvim",
	event = 'VimEnter',
	opts = {
		delay = 0,
		mappings = vim.g.have_nerd_font,
		-- Document existing key chains
		spec = {
			{ '<leader>c', group = '[C]ode',     mode = { 'n', 'x' } },
			{ '<leader>d', group = '[D]ocument' },
			{ '<leader>h', group = '[H]arpoon' },
			{ '<leader>r', group = '[R]ename' },
			{ '<leader>s', group = '[S]earch' },
			{ '<leader>w', group = '[W]orkspace' },
			{ '<leader>t', group = '[T]oggle' },
		},
	},
}
