require('reversed_R/basic_config')
require('reversed_R/setup_plugin')

require('reversed_R/plugins/colorscheme')

require('reversed_R/plugins/nvim_tree')
--api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {silent = true})
--
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<C-v>', '<C-q>', { remap = true }) --cannot work...
vim.keymap.set('n', '<leader>t', ':ToggleTerm<CR>')
vim.keymap.set('n', '<leader>w', '<C-w><C-w>')
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')


require('reversed_R/plugins/nvim_cursorline')
require('reversed_R/plugins/nvim_web_devicons')
require('reversed_R/plugins/lualine')
require('reversed_R/plugins/toggleterm')
require('reversed_R/plugins/nvim_ts_autotag')
require('reversed_R/plugins/nvim_autopairs')
require('reversed_R/plugins/nvim_treesitter')
require('reversed_R/plugins/hlchunk') --cannot work...
