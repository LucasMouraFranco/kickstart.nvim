vim.pack.add{"https://github.com/numtostr/fterm.nvim"}

require'FTerm'.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})

require("which-key").add({
  { "<leader>t", group = "[T]erminal", mode = { "n", "t" } },
  { "<leader>ts", group = "[S]plit" },
})

vim.keymap.set('n', '<leader>tt', '<CMD>lua require("FTerm").toggle()<CR>', { desc = "[T]erminal [T]oggle" })
-- Toggle terminal while inside the terminal buffer
vim.keymap.set('t', '<C-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { desc = "[T]erminal [T]oggle" })

-- Kill the terminal session
vim.keymap.set('n', '<leader>tx', '<CMD>FTermExit<CR>', { desc = "[T]erminal E[x]it" })
vim.keymap.set('t', '<C-x>', '<C-\\><C-n><CMD>FTermExit<CR>', { desc = "[T]erminal E[x]it" })

vim.api.nvim_create_user_command('FTermExit', require('FTerm').exit, { bang = true })

-- Run current Python file in a floating terminal
vim.keymap.set('n', '<leader>tp', function()
  require('FTerm').run('python3 ' .. vim.fn.shellescape(vim.fn.expand('%')))
end, { desc = "[T]erminal Run [P]ython file" })

vim.keymap.set('n', '<leader>tsh', '<CMD>split<CR><CMD>terminal<CR>', { desc = "[T]erminal [S]plit [H]orizontal" })
vim.keymap.set('n', '<leader>tsv', '<CMD>vsplit<CR><CMD>terminal<CR>', { desc = "[T]erminal [S]plit [V]ertical" })


