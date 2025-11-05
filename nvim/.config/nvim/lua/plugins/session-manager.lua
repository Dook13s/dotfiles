-- lua/plugins/session-manager.lua
return {
  "Shatur/neovim-session-manager",
  config = function()
    local config = require("session_manager.config")
    require("session_manager").setup({
      sessions_dir = vim.fn.stdpath("data") .. "/sessions/", -- Directory to store session files
      path_replacer = "__", -- Indicator for replacing sensitive paths, like '~'
      colon_replacer = "++", -- Indicator for replacing filename colons
      autoload_mode = config.AutoloadMode.Disabled, -- Load session on startup: Disabled, LastSession, CurrentDirSession
      autosave_last_session = true, -- Automatically save session on exit
      autosave_ignore_not_normal = true, -- Plugin integrations like fugitive/NvimTree might save unnecessary sessions. Only save when the current buffer is in a normal state.
      autosave_ignore_dirs = {}, -- Absolute paths to ignore when autosaving sessions
      autosave_ignore_filetypes = { -- Filetypes to ignore when autosaving sessions
        "gitcommit",
        "gitrebase",
      },
      autosave_only_in_dirs = {}, -- Use this to save sessions only when Neovim was started in specific directories
      max_path_length = 80, -- Shorten the display path if it exceeds this many characters
      -- Optional: Bindings for session management commands
      -- Can be added via which-key or standard vim.keymap.set
    })

    -- Example keymaps (add to your main keymaps file or here)
    vim.keymap.set("n", "<leader>ss", "<cmd>SessionManager load_session<CR>", { desc = "Load Session" })
    vim.keymap.set("n", "<leader>sl", "<cmd>SessionManager load_last_session<CR>", { desc = "Load Last Session" })
    vim.keymap.set("n", "<leader>sd", "<cmd>SessionManager delete_session<CR>", { desc = "Delete Session" })
    vim.keymap.set("n", "<leader>sc", "<cmd>SessionManager load_current_dir_session<CR>", { desc = "Load Session for Current Dir" })
  end,
}


