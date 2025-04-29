-- lua/plugins/dap-ui.lua
return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup({
      -- layouts = { ... }, -- Customize layout if needed
      -- controls = { ... }, -- Customize controls if needed
      -- floating = { ... }, -- Customize floating window behavior
      icons = { expanded = "▾", collapsed = "▸", current_frame = "" },
      mappings = {
        -- Expand/collapse/open nodes in the tree
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      -- Configure elements to display
      elements = {
        { id = "scopes", size = 0.25 },
        { id = "breakpoints", size = 0.25 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      render = {
        max_value_lines = 100, -- Display more lines for values when expanded
      }
    })

    -- Toggle DAP UI with a keymap
    vim.keymap.set("n", "<leader>du", function() dapui.toggle() end, { desc = "Toggle DAP UI" })
    vim.keymap.set("n", "<leader>do", function() dapui.open() end, { desc = "Open DAP UI" })
    vim.keymap.set("n", "<leader>dc", function() dapui.close() end, { desc = "Close DAP UI" })


    -- Automatically open/close DAP UI when debugging starts/stops
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}

