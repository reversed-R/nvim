require('hrk1/basic_config')
require('hrk1/setup_plugin')

require('hrk1/plugins/colorscheme')

require('hrk1/plugins/nvim_tree')
--api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {silent = true})
--
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<C-v>', '<C-q>', {remap = true}) --cannot work...
vim.keymap.set('n', '<leader>t', ':ToggleTerm<CR>')
vim.keymap.set('n', '<leader>w', '<C-w><C-w>')
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')


require('hrk1/plugins/nvim_cursorline')
require('hrk1/plugins/nvim_web_devicons')
require('hrk1/plugins/lualine')
require('hrk1/plugins/toggleterm')
require('hrk1/plugins/nvim_ts_autotag')
require('hrk1/plugins/nvim_autopairs')
require('hrk1/plugins/nvim_treesitter')
