---@type LazySpec
return {
  {
    "amitds1997/remote-nvim.nvim",
    version = "*", -- Pin to the latest stable release
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required dependency
      "MunifTanjim/nui.nvim", -- UI component library
      "nvim-telescope/telescope.nvim", -- For picker UI
    },
    config = function()
      require("remote-nvim").setup({
        -- Default SSH config path
        ssh_config = {
          ssh_config_file_paths = { "$HOME/.ssh/config" },
        },
        -- Remote configuration
        remote = {
          app_name = "nvim", -- Neovim app name on remote
          copy_dirs = {
            -- Copy your local Neovim config to remote
            config = {
              base = vim.fn.stdpath("config"),
              dirs = "*",
              compression = {
                enabled = true,
              },
            },
            data = {
              base = vim.fn.stdpath("data"),
              dirs = {
                "lazy", -- Copy lazy.nvim plugins
              },
              compression = {
                enabled = true,
              },
            },
            cache = {
              base = vim.fn.stdpath("cache"),
              dirs = {},
              compression = {
                enabled = true,
              },
            },
            state = {
              base = vim.fn.stdpath("state"),
              dirs = {},
              compression = {
                enabled = true,
              },
            },
          },
        },
        -- Client-server configuration
        client_callback = function(port, workspace_config)
          local cmd = ("wezterm cli set-tab-title --pane-id $(wezterm cli get-pane-direction Up) 'Remote: %s'"):format(
            workspace_config.host
          )
          vim.fn.system(cmd)
        end,
        -- Log level (trace, debug, info, warn, error)
        log = {
          level = "info",
        },
      })
    end,
    keys = {
      -- Keybindings for remote-nvim
      { "<leader>rr", "<cmd>RemoteStart<cr>", desc = "Remote Start" },
      { "<leader>rs", "<cmd>RemoteStop<cr>", desc = "Remote Stop" },
      { "<leader>ri", "<cmd>RemoteInfo<cr>", desc = "Remote Info" },
      { "<leader>rc", "<cmd>RemoteCleanup<cr>", desc = "Remote Cleanup" },
      { "<leader>rl", "<cmd>RemoteLog<cr>", desc = "Remote Log" },
      { "<leader>rd", "<cmd>RemoteConfigDel<cr>", desc = "Remote Config Delete" },
    },
  },
}
