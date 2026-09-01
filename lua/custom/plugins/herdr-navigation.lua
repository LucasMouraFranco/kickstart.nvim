-- Load after the base configuration so these mappings cross Herdr pane edges.
local navigation = vim.fn.expand '~/src/personal/vim-herdr-navigation/editor/nvim.lua'

if vim.uv.fs_stat(navigation) then
  dofile(navigation)
end
