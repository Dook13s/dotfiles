return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux"
  },
  config = function()
    vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", {})
    vim.keymap.set("n", "<leader>T", ":TestFile<CR>", {})
    vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", {})
    vim.keymap.set("n", "<leader>l", ":TestLast<CR>", {})
    vim.keymap.set("n", "<leader>g", ":TestVisit<CR>", {})
    vim.cmd("let test#strategy = 'vimux'")
    vim.cmd("let g:test#preserve_screen = 1")  -- Keeps test output visible
    vim.cmd("let g:test#echo_command = 0")     -- Disables default echo
    vim.cmd("highlight! link VimuxPrompt TestOutput")  -- Applies Flamingo to Vimux
  
  end,

}
