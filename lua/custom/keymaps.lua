-- Put personal, non-plugin keymaps here.
-- Use `:Telescope keymaps` (or `<leader>fk`) to browse active mappings.

vim.keymap.set('n', '<C-w>|', '<cmd>vsplit<cr>', {
  desc = 'Vertical split',
})

vim.keymap.set('n', '<C-w>-', '<cmd>split<cr>', {
  desc = 'Horizontal split',
})

local terminal_buf
local terminal_win

local function toggle_bottom_terminal()
  if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
    vim.api.nvim_win_close(terminal_win, true)
    terminal_win = nil
    return
  end

  vim.cmd 'botright 15split'
  terminal_win = vim.api.nvim_get_current_win()

  if terminal_buf and vim.api.nvim_buf_is_valid(terminal_buf) then
    vim.api.nvim_win_set_buf(terminal_win, terminal_buf)
  else
    vim.cmd 'terminal'
    terminal_buf = vim.api.nvim_get_current_buf()
  end

  vim.cmd 'startinsert'
end

vim.keymap.set('n', '<D-j>', toggle_bottom_terminal, {
  desc = 'Toggle bottom terminal',
})

vim.keymap.set('t', '<D-j>', function()
  vim.api.nvim_feedkeys(vim.keycode '<C-\\><C-n>', 'n', false)
  vim.schedule(toggle_bottom_terminal)
end, {
  desc = 'Toggle bottom terminal',
})
