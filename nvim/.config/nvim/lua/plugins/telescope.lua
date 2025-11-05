-- lua/plugins/telescope.lua
return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- Override the default <leader>ff find files
      {
        "<c-p>", -- Map Ctrl+P
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find Files (Root Dir)",
      },
      -- Keep other useful Telescope mappings if desired
      { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Find Text (Grep)" },
      { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Find Buffers" },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Find Help" },
      -- Add more mappings as needed
    },
  },
}

