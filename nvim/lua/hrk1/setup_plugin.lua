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

  --use ddc instead
  --{'neoclide/coc.nvim', branch = 'release'},
  --
  --not usable
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

  --{
   -- "shellRaining/hlchunk.nvim",
    --event = { "BufReadPre", "BufNewFile" },
  --},
  --cannot work...
  {
    "shellRaining/hlchunk.nvim",
  },
  --{'tani/vim-jetpack', opt = 1},
  
  --for vim ddc - autocomplete package for vim/neovim
  {'tani/vim-jetpack', opt = 1},
  {'Shougo/ddc.vim'},
  {'vim-denops/denops.vim'},
  {'Shougo/ddc-ui-native'},
  {'Shougo/ddc-source-around'},
  {'tani/ddc-fuzzy'},
  --	
  {'prabirshrestha/vim-lsp'},
	{'mattn/vim-lsp-settings'},
	{'Shougo/ddc.vim'},
	{'Shougo/ddc-around'},
	{'matsui54/ddc-buffer'},
	{'shun/ddc-source-vim-lsp'},
  --
  --
}

--for vim ddc - autocomplete package for vim/neovim
---------
-- LSP Settings
---------
vim.keymap.set('n', '<leader>li', ':LspManageServers<CR>')
vim.keymap.set('n', '<leader>LI', ':LspInstallServer<CR>')
vim.keymap.set('n', '<leader>ls', ':LspStatus<CR>')
vim.keymap.set('n', '<leader>lh', ':LspHover<CR>')
vim.keymap.set('n', ']d', ':LspNextDiagnostic<CR>')
vim.keymap.set('n', '[d', ':LspPreviousDiagnostic<CR>')
vim.keymap.set('n', ']e', ':LspNextError<CR>')
vim.keymap.set('n', '[e', ':LspPreviousError<CR>')
vim.keymap.set('n', '<C-]>', ':LspDefinition<CR>')


--for vim ddc - autocomplete package for vim/neovim
vim.fn["ddc#custom#patch_global"]('ui', 'native')  -- uiは一番最初に設定する必要がある

vim.fn["ddc#custom#patch_global"]('sources', {'vim-lsp', 'around', 'buffer'})

vim.fn["ddc#custom#patch_global"]('sourceOptions', {
  _ = {
    matchers = {'matcher_fuzzy'},
    sorters = {'sorter_fuzzy'},
    converters = {'converter_fuzzy'},
		ignoreCase = true,
  },
	around = {
		mark =  {'Arround'},
	},
	buffer = {
		mark = {'Buffer'},
	},
	vimLsp = {
		mark = {'LSP'},
		forceCompletionPattern = {'\\.\\w*|:\\w*|->\\w*'},
	},
})

vim.fn["ddc#custom#patch_global"]('sourceParams', {
  around = { maxSize = 500 },
	buffer = {
		limitBytes = 5000000,
    forceCollect = true,
		fromAltBuf = true,
	},
})
---------
-- Ddc Settings
---------

vim.fn["ddc#enable"]()
----

