-- See https://github.com/folke/which-key.nvim for docs

local wk = require("which-key")

wk.register({
  ["<leader><tab>"] = { "<C-^>", "Alternate file" },
  ["<leader>"] = {
    p = {
      name = "+project",
      t = { ":NvimTreeFindFileToggle<cr>",  "Toggle file tree" },
    },
    f = {
      name = "+file",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      r = { "<cmd>Telescope oldfiles<cr>",   "Open Recent File" },
      n = { "<cmd>enew<cr>",                 "New File" },
      s = { "<cmd>w<cr>",                    "Save File" },
      S = { "<cmd>wa<cr>",                   "Save all Files" },
    },
    ["f/"] = { ":NvimTreeFindFileToggle<cr>",  "Toggle file tree" },
    ["ft"] = { ":NvimTreeFindFileToggle<cr>",  "Toggle file tree" },
    b = {
      name = "+buffer",
      -- b = { "<cmd>buffers<cr><cmd>buffer<space><cr>", "Select buffer" }, -- in keymaps.lua
      d = { "<cmd>bdelete<cr>", "Delete buffer" },
      n = { "<cmd>bn<cr>",      "Next buffer" },
      p = { "<cmd>bp<cr>",      "Prev buffer" },
    },
    q = {
      name = "+quit",
      q = { "<cmd>qa<cr>",   "Quit all" },
      Q = { "<cmd>qa!<cr>",  "Quit all!" },
    },
    w = {
      name = "+windows",
      h = { "<C-W>h",     "Window left" },
      l = { "<C-W>l",     "Window right" },
      k = { "<C-W>k",     "Window up" },
      j = { "<C-W>j",     "Window down" },
      d = { "<cmd>q<cr>", "Delete window" },
    },
    ["w-"] = { "<cmd>sp<cr>",  "Split horizontal" },
    ["w/"] = { "<cmd>vsp<cr>", "Split vertical" },
    ["w="] = { "<C-w>=",       "Equalize width" },
    s = {
      name = "+search",
      c = { "<cmd>noh<cr>",    "Clear highlights" },
    },
    t = {
      name = "+toggle",
      n = { "<cmd>set number!<cr>",  "Toggle line numbers" },
    },
    o = {
      name = "+copilot",
      s = { "<cmd>Copilot setup<cr>",     "Copilot setup" },
      d = { "<cmd>Copilot disable<cr>",   "Disable copilot" },
      e = { "<cmd>Copilot enable<cr>",    "Enable copilot" },
      x = { "<cmd>Copilot signout<cr>",   "Signout from copilot" },
      t = { "<cmd>Copilot status<cr>",    "Copilot status" },
      p = { "<cmd>Copilot panel<cr>",     "Copilot panel" },
      v = { "<cmd>Copilot version<cr>",   "Copilot version" },
      f = { "<cmd>Copilot feedback<cr>",  "Copilot feedback" },
    },
  },
})

