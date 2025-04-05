-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
  { "catppuccin/nvim", name = "catppuccin" },
  { "justinmk/vim-sneak" },  -- Type `sxy` to jump to "xy"

}
lvim.transparent_window = true
lvim.colorscheme = "catppuccin"
vim.g.catppuccin_flavour = "mocha"

lvim.keys.insert_mode["jk"] = "<ESC>"
lvim.keys.insert_mode["kj"] = "<ESC>"
lvim.keys.visual_mode["jk"] = "<ESC>"
lvim.keys.visual_mode["kj"] = "<ESC>"

-- Override default keymaps for Telescope
lvim.keys.normal_mode["<C-f>"] = ":Telescope live_grep<CR>"
lvim.keys.normal_mode["<C-p>"] = ":Telescope find_files<CR>"

-- (Optional) Also make them work in insert mode
vim.keymap.set("i", "<C-f>", "<ESC>:Telescope live_grep<CR>")
vim.keymap.set("i", "<C-p>", "<ESC>:Telescope find_files<CR>")

vim.opt.relativenumber = true
