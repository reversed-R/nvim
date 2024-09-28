require('nvim-tree').setup({
  sort_by = 'case_sensitive',
  view = {
    adaptive_size = true,
    --mappings = {
    --  list = {
    --    {key = 'u', action = 'dir_up'},
    --  },
    --},
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

require("nvim-tree.api").tree.toggle(false, true)
--require("nvim-tree.api").nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {silent = true})
