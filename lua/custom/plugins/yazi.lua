vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/mikavilpas/yazi.nvim',
}

require('yazi').setup {
  open_for_directories = false,
  keymaps = {
    show_help = '<f1>',
    change_working_directory = '<c-d>',
  },
}

vim.keymap.set('n', '<leader>ef', '<cmd>Yazi<cr>', { desc = '[E]xplore [F]ile' })
vim.keymap.set('n', '<leader>ed', '<cmd>Yazi cwd<cr>', { desc = '[E]xplore [D]irectory' })

require("which-key").add({
	{ "<leader>e", group = "[E]xplore", mode = { "n", "v" } },
})
