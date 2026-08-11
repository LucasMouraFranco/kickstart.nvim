-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '<leader>ee', '<cmd>Neotree toggle<CR>', { desc = '[E]xplore File Tr[e]e', silent = true })

local function toggle_filter(state, flag)
  local f = state.filtered_items
  f[flag] = not f[flag]
  f.visible = not f.hide_dotfiles and not f.hide_gitignored
  require('neo-tree.sources.filesystem.commands').refresh(state)
end

require('neo-tree').setup {
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = false,
    },
    window = {
      mappings = {
        ['<leader>ee'] = 'close_window',
        ['H'] = function(state)
          toggle_filter(state, 'hide_dotfiles')
        end,
        ['G'] = function(state)
          toggle_filter(state, 'hide_gitignored')
        end,
      },
    },
  },
}
