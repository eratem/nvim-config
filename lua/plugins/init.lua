return {
  -- Use json based LSP configurations
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  -- Neovim plugin development support
  "folke/neodev.nvim",
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  -- easily change the surroundings of your selection (parentheses)
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- config here
      })
    end
  },
}
