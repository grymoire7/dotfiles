-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { 'Mofiqul/dracula.nvim' }, -- theme
  { 'tpope/vim-rails' }, -- ruby on rails
  { 'kdheepak/lazygit.nvim' }, -- lazy git
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup {
        mapping = { "jk" }, -- a table with mappings to use
        timeout = 200, -- the time in which the keys must be hit in ms. clear_empty_lines = false, keys = '<ESC>', -- keys used for escaping
      }
    end
  },
  { "github/copilot.vim" }, -- github ai helper
  -- { "preservim/vimux" }, -- send test command in tmux pane
  -- { "vim-test/vim-test" }, -- run test
  -- { "tpope/vim-abolish" }, -- search and replace preserving state
}

-- use ; for :
vim.keymap.set({ "n", "x" }, ";", ":")

lvim.builtin.which_key.mappings["<tab>"] = {
  "<C-^>", "Alternate file"
}

lvim.builtin.which_key.mappings["f"] = {
  name = "+file",
  f = { "<cmd>Telescope find_files<cr>", "Find File" },
  g = { "<cmd>Telescope live_grep<cr>",  "Find in Files" },
  h = { "<cmd>Telescope help_tags<cr>",  "Help Tags" },
  b = { "<cmd>Telescope buffers<cr>",    "Find Buffer" },
  r = { "<cmd>Telescope oldfiles<cr>",   "Open Recent File" },
  n = { "<cmd>enew<cr>",                 "New File" },
  s = { "<cmd>w<cr>",                    "Save File" },
  S = { "<cmd>wa<cr>",                   "Save all Files" },
}

lvim.builtin.which_key.mappings["w"] = {
  name = "+windows",
  h = { "<C-W>h",     "Window left" },
  l = { "<C-W>l",     "Window right" },
  k = { "<C-W>k",     "Window up" },
  j = { "<C-W>j",     "Window down" },
  d = { "<cmd>q<cr>", "Delete window" },
}

lvim.builtin.which_key.mappings["w="] = {
  "<C-w>=", "Equalize width"
}

lvim.builtin.which_key.mappings["w-"] = {
  "<cmd>sp<cr>", "Split horizontal"
}

lvim.builtin.which_key.mappings["w/"] = {
  "<cmd>vsp<cr>", "Split vertical"
}

lvim.builtin.which_key.mappings["o"] = {
  name = "+copilot",
  s = { "<cmd>Copilot setup<cr>",     "Copilot setup" },
  d = { "<cmd>Copilot disable<cr>",   "Disable copilot" },
  e = { "<cmd>Copilot enable<cr>",    "Enable copilot" },
  x = { "<cmd>Copilot signout<cr>",   "Signout from copilot" },
  t = { "<cmd>Copilot status<cr>",    "Copilot status" },
  p = { "<cmd>Copilot panel<cr>",     "Copilot panel" },
  v = { "<cmd>Copilot version<cr>",   "Copilot version" },
  f = { "<cmd>Copilot feedback<cr>",  "Copilot feedback" },
}

lvim.builtin.which_key.mappings["q"] = {
  "<cmd>qa<cr>", "Quit all"
}

lvim.builtin.which_key.mappings["Q"] = {
  "<cmd>qa!<cr>", "Quit all!"
}

lvim.builtin.which_key.mappings["fq"] = {
  "<cmd>q<cr>", "Quit"
}

lvim.builtin.which_key.mappings["fQ"] = {
  "<cmd>q!<cr>", "Quit!"
}
