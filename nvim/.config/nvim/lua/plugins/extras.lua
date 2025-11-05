-- lua/plugins/extras.lua
-- This file configures plugins enabled via LazyVim extras in lua/config/lazy.lua
return {
  -- Configure conform.nvim (formatter)
  {
    "stevearc/conform.nvim",
    -- This opts table will be merged with the LazyVim default configuration
    opts = {
      -- Define your formatters here
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { { "prettierd", "prettier" } }, -- Use prettierd first, fallback to prettier
        typescript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
        scss = { { "prettierd", "prettier" } },
        json = { { "prettierd", "prettier" } },
        yaml = { { "prettierd", "prettier" } },
        markdown = { { "prettierd", "prettier" } },
        graphql = { { "prettierd", "prettier" } },
        -- Add other filetypes and formatters as needed
        -- Ensure these formatters are installed via Mason or globally accessible
        ["_"] = { "trim_whitespace" }, -- Default formatter for any filetype
      },
      -- Optional: Configure format on save
      -- format_on_save = {
      --   timeout_ms = 500,
      --   lsp_fallback = true, -- Fallback to LSP formatting if conform fails
      -- },
      -- Optional: Turn off LSP formatting if you only want conform to handle it
      -- format_after_save = false, -- Turn this on if format_on_save is enabled

      -- Conform logging level (useful for debugging)
      log_level = vim.log.levels.ERROR, -- Set to DEBUG for verbose logging

      -- Conform notification level
      notify_on_error = true, -- Notify on formatting errors
    },
    -- Add keymap for formatting
    keys = {
      {
        "<C-l>", -- Map Ctrl+L
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = { "n", "v" }, -- Normal and Visual mode
        desc = "Format Code",
      },
    },
  },

  -- Configure nvim-lint (linter)
  {
    "mfussenegger/nvim-lint",
    -- This opts table will be merged with the LazyVim default configuration
    opts = {
      -- Enable linting events (LazyVim defaults usually cover this)
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      linters_by_ft = {
        python = { "flake8" }, -- Example: use flake8 for python
        javascript = { "eslint_d" }, -- Example: use eslint_d for javascript
        typescript = { "eslint_d" }, -- Example: use eslint_d for typescript
        -- Add other linters here
        -- Ensure these linters are installed via Mason or globally
      },
      -- Customize linting diagnostics appearance if needed
      -- lint_opts = { ... }
    },
  },

  -- Ensure Mason is configured to install necessary tools
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Formatters
        "stylua",
        "black",
        "isort",
        "prettierd",
        "prettier",
        -- Linters
        "flake8",
        "eslint_d",
        -- Debug Adapters (add based on your needs)
        "debugpy", -- Python
        "node-debug2-adapter", -- Node.js
        -- LSPs (LazyVim usually handles this, but you can ensure specific ones)
        "lua-language-server",
        "pyright",
        "typescript-language-server",
      },
    },
  },
}
