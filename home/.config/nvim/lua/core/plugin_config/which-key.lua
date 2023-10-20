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
      g = { "<cmd>Telescope live_grep<cr>",  "Find in Files" },
      h = { "<cmd>Telescope help_tags<cr>",  "Help Tags" },
      b = { "<cmd>Telescope buffers<cr>",    "Find Buffer" },
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
    c = {
      name = "+code",
      b = { "<cmd>Git blame<cr>",              "Git blame window" },
      l = { "<cmd>Git log<cr>",                "Git log" },
      s = { "<cmd>Git<cr>",                    "Git status" },
      t = {
        name = "+telescope",
        b = { "<cmd>Telescope git_branches<cr>",       "Find branch" },
        c = { "<cmd>Telescope git_commits<cr>",        "Find commit" },
        s = { "<cmd>Telescope git_status<cr>",         "Find status" },
        t = { "<cmd>Telescope git_stash<cr>",          "Find stash" },
        f = { "<cmd>Telescope git_bcommits<cr>",       "Find buffer commit" },
        r = { "<cmd>Telescope git_bcommits_range<cr>", "Find buffer commit range" },
      },
      w = {
        name = "+workspace",
        o = { "<cmd>tabnew<cr>",               "Open new tab" },
        c = { "<cmd>tabclose<cr>",             "Close tab" },
        n = { "<cmd>tabnext<cr>",              "Next tab" },
        p = { "<cmd>tabprev<cr>",              "Previous tab" },
      },
      z = { "<cmd>LazyGit<cr>",                "Launch LazyGit" },
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
      b = { "<cmd>Gitsigns toggle_current_line_blame<cr>",  "Toggle current line blame" },
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

