-- lua/plugins/nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
  version = "*", -- Use the latest stable release
  lazy = false, -- Load it eagerly if you want it available on startup
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Optional: for file icons
  },
  config = function()
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        group_empty = true,
        icons = {
          glyphs = {
            default = "", -- Default icon
            symlink = "",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "",
              staged = "S",
              unmerged = "",
              renamed = "➜",
              untracked = "U",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      filters = {
        dotfiles = false, -- Show dotfiles
        custom = { ".git", "node_modules", ".cache" }, -- Hide specific folders/files
      },
      git = {
        enable = true,
        ignore = false, -- Show ignored files
      },
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      diagnostics = {
        enable = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      actions = {
        open_file = {
          quit_on_open = false, -- Keep nvim-tree open when opening a file
        },
      },
      -- Optional: Add keymaps for nvim-tree
      -- on_attach = function(bufnr)
      --   local api = require('nvim-tree.api')
      --   local opts = { noremap = true, silent = true, buffer = bufnr }
      --   vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts)
      --   vim.keymap.set('n', '?', api.tree.toggle_help, opts)
      -- end,
    })

    -- Keymap to toggle NvimTree
    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
    vim.keymap.set("n", "<leader>E", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle NvimTree Find File" })
  end,
}

