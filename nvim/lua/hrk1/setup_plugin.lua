local jetpackfile = vim.fn.stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
--local jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
local jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"

if vim.fn.filereadable(jetpackfile) == 0 then
  vim.fn.system(string.format('curl -fsSLo %s --create-dirs %s', jetpackfile, jetpackurl))
end

vim.cmd('packadd vim-jetpack')

require('jetpack.paq') {
  {'tani/vim-jetpack', opt = 1},

  'junegunn/fzf.vim',
  {'junegunn/fzf', run = 'call fzf#install()'},
  {'neoclide/coc.nvim', branch = 'release'},
  --{'neoclide/coc.nvim', branch = 'master', run = 'apt install --frozen-lockfile'},
  {'vlime/vlime', rtp = 'vim'},
  {'dracula/vim', as = 'dracula'},
  {'tpope/vim-fireplace', ft = 'clojure'},
  
  
  'navarasu/onedark.nvim',
  {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
  {'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    }
  },
  
  'yamatsum/nvim-cursorline',
  'nvim-tree/nvim-web-devicons',
  {
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim_web_devicons'
  },
  'akinsho/toggleterm.nvim',
  'windwp/nvim-ts-autotag',
  'windwp/nvim-autopairs',

  --{'tani/vim-jetpack', opt = 1},
}

