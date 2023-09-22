return {
	-- Bindings by thePrimeagen
	vim.keymap.set("n", "<leader>dn", vim.cmd.Ex, { desc = '[D]irectory [N]avigation' }),
	vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move selected stuff down' }),
	vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move selected stuff up' }),
	vim.keymap.set("n", "J", "mzJ`z", { desc = 'append line below but keep cursor' }),
	vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'move page down and center cursor' }),
	vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'move page up and center cursor' }),
	vim.keymap.set("n", "n", "nzzzv", { desc = 'jump to next search match, center and highlight line' }),
	vim.keymap.set("n", "N", "Nzzzv", { desc = 'jump to previous search match, center and highlight line' }),
	vim.keymap.set("x", "<leader>p", [[_dP]], { desc = 'paste over selection, keep register' }),
	vim.keymap.set("n", "<leader>y", [["+y]], { desc = 'yank to system clipboard' }),
	vim.keymap.set("v", "<leader>y", [["+y]], { desc = 'yank to system clipboard' }),
	vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = 'yank till end of line to system clipboard' }),
	vim.keymap.set("n", "<leader>x", [["_d]], { desc = '[D]elete without writing to [R]egister' }),
	vim.keymap.set("v", "<leader>x", [["_d]], { desc = '[D]elete without writing to [R]egister' }),
	vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
		{ desc = 'search and replace word under cursor' }),
	vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "use Escape to leave insert in terminal" }),

	-- Bindings by kickstart nvim
	-- See `:help vim.keymap.set()`
	vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true }),

	-- Remap for dealing with word wrap
	vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true }),
	vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true }),
}
