local mapkey = require("util.keymapper").mapkey

local keys = {
	-- See `:help telescope.builtin`
	mapkey("n", "<leader>?", "Telescope oldfiles", { desc = '[?] Find recently opened files' }),
	mapkey("n", "<leader><space>", "Telescope buffers", { desc = '[ ] Find existing buffers' }),
	mapkey("n", "<leader>sf", "Telescope git_files", { desc = 'Search [g]it [f]iles' }),
	mapkey("n", "<leader>sF", "Telescope find_files", { desc = '[s]earch [F]iles' }),
	mapkey("n", "<leader>sh", "Telescope help_tags", { desc = '[s]earch [h]elp' }),
	mapkey("n", "<leader>sw", "Telescope grep_string", { desc = '[s]earch current [w]ord' }),
	mapkey("n", "<leader>sg", "Telescope live_grep", { desc = '[s]earch by [g]rep' }),
	mapkey("n", "<leader>sd", "Telescope diagnostics", { desc = '[s]earch [d]iagnostics' }),
	mapkey("n", "<leader>sr", "Telescope resume", { desc = '[s]earch [r]esume' }),
	mapkey('n', '<leader>sk', 'Telescope keymaps', { desc = '[s]earch [k]eymaps' }),
	mapkey('n', '<leader>ss', 'Telescope builtin', { desc = '[s]earch tele[s]cope' }),
	vim.keymap.set('n', '<leader>/', function()
		-- You can pass additional configuration to telescope to change theme, layout, etc.
		require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
			winblend = 10,
			previewer = false,
		})
	end, { desc = '[/] Fuzzily search in current buffer' }),
}
-- See `:help telescope` and `:help telescope.setup()`
local defaults = {
	mappings = {
		i = {
			['<C-u>'] = false,
			['<C-d>'] = false,
		},
	}
}
return {
	'nvim-telescope/telescope.nvim',
	event = 'VimEnter',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
	},
	defaults = defaults,
}
