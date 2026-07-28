-- Put personal, non-plugin keymaps here.
-- Use `:Telescope keymaps` (or `<leader>fk`) to browse active mappings.

vim.keymap.set('n', '<C-w>|', '<cmd>vsplit<cr>', {
  desc = 'Vertical split',
})

vim.keymap.set('n', '<C-w>-', '<cmd>split<cr>', {
  desc = 'Horizontal split',
})
