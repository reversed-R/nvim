--cannot work...
require('hlchunk').setup({
  default_conf = {
    --event = { "BufReadPre", "BufNewFile" },
    event = { "UIEnter" },
    enable = false,
    style = {},
    notify = false,
    priority = 0,
    exclude_filetypes = {
        aerial = true,
        dashboard = true,
        -- some other filetypes
    }
  }
})
