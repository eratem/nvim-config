local config = function()
    require("nvim-treesitter.configs").setup({
        build = ":TSUpdate",
        event = {
            "BufRedPre",
            "BufNewFile",
        },
        ensure_installed = {
            "markdown",
            "json",
            "yaml",
            "bash",
            "lua",
            "dockerfile",
            "gitignore",
            "python",
            "rust",
            "arduino",
            "cmake",
            "cpp",
            "sql",
        },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = true,
        },
        incremental_selection = {
            enable = true,
        },
    })
    vim.filetype.add({
        pattern = {
            ['.*.pg'] = 'postgres',
        },
    })
    vim.treesitter.language.register('sql', { 'postgres' })
end

return
{
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = config,
    lazy = false,
}
