local remap = vim.keymap.set
return {
	-- Bindings by thePrimeagen
	remap("n", "<leader>dn", vim.cmd.Ex, { desc = '[d]irectory [n]avigation' }),
	remap("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move selected stuff down' }),
	remap("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move selected stuff up' }),
	remap("n", "J", "mzJ`z", { desc = 'append line below but keep cursor' }),
	remap("n", "<C-d>", "<C-d>zz", { desc = 'move page down and center cursor' }),
	remap("n", "<C-u>", "<C-u>zz", { desc = 'move page up and center cursor' }),
	remap("n", "n", "nzzzv", { desc = 'jump to next search match, center and highlight line' }),
	remap("n", "N", "Nzzzv", { desc = 'jump to previous search match, center and highlight line' }),
	remap("x", "<leader>p", [[_dP]], { desc = 'paste over selection, keep register' }),
	remap("n", "<leader>x", [["_d]], { desc = 'Delete without writing to Register' }),
	remap("v", "<leader>x", [["_d]], { desc = 'Delete without writing to Register' }),
	remap("n", "<leader>sc", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
		{ desc = '[s]earch and [c]hange (replace) word under cursor' }),
	remap("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "use Escape to leave insert in terminal" }),

	-- Bindings by kickstart nvim
	-- See `:help remap()`
	remap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true }),
	remap('n', '<Esc>', '<cmd>nohlsearch<CR>'),

	-- Remap switching windows with one command
	remap("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" }),
	remap("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" }),
	remap("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" }),
	remap("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" }),

	-- Remap for dealing with word wrap
	remap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true }),
	remap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true }),

	-- Keep visual selection on indent shift
	remap('v', '<', "<gv", { desc = "indent left, keep selection" }),
	remap('v', '>', ">gv", { desc = "indent right, keep selection" }),

	-- Diagnostic keymaps
	remap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' }),
	remap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' }),
	remap('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' }),
	remap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' }),
}
