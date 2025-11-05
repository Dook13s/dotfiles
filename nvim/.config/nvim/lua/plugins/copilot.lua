-- lua/plugins/copilot.lua
return {
  {
    "github/copilot.vim",
    lazy = false, -- Or set to true and trigger on InsertEnter or BufRead
    config = function()
      -- Set `g:copilot_no_tab_map = true` if you want to manually map Tab
      -- vim.g.copilot_no_tab_map = true

      -- Basic configuration, check :help copilot for more options
      vim.g.copilot_filetypes = {
        ["*"] = true, -- Enable for all filetypes by default
        -- ["markdown"] = false, -- Example: Disable for markdown
        -- ["."] = true, -- Enable for buffers with no name
      }

      -- Custom mapping for accepting suggestion with Tab
      -- This uses Lua equivalents of the Vimscript mappings suggested by copilot.vim
      local function check_back_space()
        local col = vim.fn.col(".") - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
      end

      -- Use Tab for completion if available, otherwise fallback to Tab or indent
      -- Requires `g:copilot_no_tab_map = true` if you define this manually
      -- _G.copilot_tab_complete = function()
      --   local copilot_keys = vim.fn["copilot#Accept"]()
      --   if copilot_keys ~= "" then
      --     -- If Copilot has a suggestion, accept it
      --     return vim.api.nvim_replace_termcodes(copilot_keys, true, true, true)
      --   elseif vim.fn.pumvisible() == 1 then
      --     -- If completion menu is visible, use Tab to navigate
      --     return vim.api.nvim_replace_termcodes("<C-n>", true, true, true)
      --   elseif check_back_space() then
      --     -- If cursor is at the beginning of the line or after whitespace, insert Tab
      --     return vim.api.nvim_replace_termcodes("<Tab>", true, true, true)
      --   else
      --     -- Otherwise, try indenting (may need luasnip or cmp integration)
      --     -- This part might need adjustment based on your snippet/completion setup
      --     -- For basic indent:
      --     return vim.api.nvim_replace_termcodes("<C-]>", true, true, true) -- Placeholder, adjust as needed
      --   end
      -- end

      -- Simplified Tab mapping: Always try to accept Copilot first
      -- If you let copilot.vim handle the Tab map (default), you don't need this.
      -- vim.keymap.set("i", "<Tab>", "copilot#Accept('<CR>')", {
      --   expr = true,
      --   replace_keycodes = false,
      --   desc = "Copilot Accept",
      --   silent = true,
      -- })

      -- Other useful Copilot mappings
      vim.keymap.set("i", "<C-]>", 'copilot#Accept("<CR>")', { expr = true, replace_keycodes = false, silent = true, desc = "Copilot Accept" })
      vim.keymap.set("i", "<C-j>", "<Plug>(copilot-next)", { desc = "Copilot Next Suggestion" })
      vim.keymap.set("i", "<C-k>", "<Plug>(copilot-previous)", { desc = "Copilot Previous Suggestion" })
      vim.keymap.set("i", "<C-h>", "<Plug>(copilot-dismiss)", { desc = "Copilot Dismiss Suggestion" })
      vim.keymap.set("n", "<leader>ca", ":Copilot auth<CR>", { desc = "Copilot Auth" })
      vim.keymap.set("n", "<leader>ce", ":Copilot enable<CR>", { desc = "Copilot Enable" })
      vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>", { desc = "Copilot Disable" })
      vim.keymap.set("n", "<leader>cs", ":Copilot status<CR>", { desc = "Copilot Status" })

      -- If you haven't authenticated Copilot yet, run :Copilot auth
    end,
  },
  -- Optional: Integrate Copilot suggestions into nvim-cmp
  {
    "nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = function(_, opts)
      -- Make sure "copilot" is added to your completion sources
      table.insert(opts.sources, 1, { name = "copilot" }) -- Add copilot source
    end,
  },
}


