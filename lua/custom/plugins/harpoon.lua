return {
	'ThePrimeagen/harpoon',
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")
		vim.keymap.set("n", "<leader>hm", mark.add_file, { desc = "Mark for Harpoon" })
		vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, { desc = "Harpoon quick menu" })
		vim.keymap.set("n", "<leader>hn", function() ui.nav_file(1) end, { desc = "jump to first harpoon file" })
		vim.keymap.set("n", "<leader>he", function() ui.nav_file(2) end, { desc = "jump to second harpoon file" })
		vim.keymap.set("n", "<leader>hi", function() ui.nav_file(3) end, { desc = "jump to third harpoon file" })
		vim.keymap.set("n", "<leader>ho", function() ui.nav_file(4) end, { desc = "jump to fourth harpoon file" })
	end,
}
