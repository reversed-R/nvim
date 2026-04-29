-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,

        -- Custom navigation mappings
        ["<C-j>"] = { "<C-d>", desc = "Scroll down half page" },
        ["<C-k>"] = { "<C-u>", desc = "Scroll up half page" },
        [";"] = { "$", desc = "Jump to line end" },
        ["m"] = { "0", desc = "Jump to line start" },

        -- Leader key mappings
        ["<Leader>t"] = {
          function()
            -- Check if there's already a terminal window open
            local term_wins = vim.tbl_filter(function(win)
              local buf = vim.api.nvim_win_get_buf(win)
              return vim.bo[buf].buftype == "terminal"
            end, vim.api.nvim_list_wins())

            if #term_wins > 0 then
              -- Close all terminal windows
              for _, win in ipairs(term_wins) do
                vim.api.nvim_win_close(win, false)
              end
            else
              -- Find existing terminal buffer
              local term_bufs = vim.tbl_filter(function(buf)
                return vim.bo[buf].buftype == "terminal" and vim.api.nvim_buf_is_valid(buf)
              end, vim.api.nvim_list_bufs())

              -- Open a split at the bottom (1/3 height)
              vim.cmd("split")
              local height = math.floor(vim.o.lines / 3)
              vim.api.nvim_win_set_height(0, height)

              if #term_bufs > 0 then
                -- Reuse existing terminal buffer
                vim.api.nvim_win_set_buf(0, term_bufs[1])
              else
                -- Create new terminal
                vim.cmd("terminal")
              end

              vim.cmd("startinsert") -- Enter terminal mode automatically
            end
          end,
          desc = "Toggle terminal",
        },
        ["<Leader>h"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Move to left buffer" },
        ["<Leader>j"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Move to right buffer" },
        ["<Leader>w"] = { "<C-w>w", desc = "Move between windows" },
      },
      t = {
        -- Terminal mode mappings
        ["jj"] = { "<C-\\><C-n>", desc = "Exit terminal mode" },
        ["<Esc>"] = { "<C-\\><C-n>", desc = "Exit terminal mode" },
      },
      v = {
        -- Visual mode mappings
        [";"] = { "$", desc = "Jump to line end" },
        ["m"] = { "0", desc = "Jump to line start" },
      },
    },
  },
}
