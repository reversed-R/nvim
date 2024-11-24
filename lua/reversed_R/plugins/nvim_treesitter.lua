require('nvim-treesitter.configs').setup{
  ensure_installed = {"c", "lua", "markdown", "html", "xml", "css", "javascript", "json", "typescript", "tsx"},
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
  },
}
