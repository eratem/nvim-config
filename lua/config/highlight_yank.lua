local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
return {
  -- See `:help vim.highlight.on_yank()`
  vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
      vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
  })
}
