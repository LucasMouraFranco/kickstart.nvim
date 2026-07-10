vim.pack.add({
  "https://github.com/folke/snacks.nvim",
})

require("snacks").setup({
  bigfile = { enabled = false },
  quickfile = { enabled = false },
  statuscolumn = { enabled = false },
  words = { enabled = false },
  input = { enabled = true },
})
