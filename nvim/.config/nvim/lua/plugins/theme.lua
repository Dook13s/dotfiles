-- lua/plugins/theme.lua
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Make sure it loads first
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      integrations = {
        -- Enable integrations as needed, LazyVim handles many defaults
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = true,
        mini = true,
        -- Add other integrations here
        dap = {
          enabled = true,
          enable_ui = true, -- Enable nvim-dap-ui integration
        },
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        lsp_trouble = true,
        mason = true,
        which_key = true,
        indent_blankline = {
          enabled = true,
          scope_color = "mauve", -- catppuccin color
          colored_indent_levels = false,
        },
        dashboard = true,
        neotree = true,
        treesitter = true,
        treesitter_context = true,
        markdown = true,
      },
    },
  },
}


