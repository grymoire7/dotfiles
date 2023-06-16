-- disable netrw at the very start of your init.lua (strongly advised)
-- seems reasonable to disable netrw if nvim-tree is installed
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  modified = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },
  sort_by = "case_sensitive",
  view = {
    width = 30,
    --- adaptive_size = true
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  update_focused_file = {
    enable = true,
  },
})

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
-- moved to which-key.lua
-- vim.keymap.set('n', '<leader>f/', ':NvimTreeFindFileToggle<CR>')
-- vim.keymap.set('n', '<leader>ft', ':NvimTreeFindFileToggle<CR>')
-- vim.keymap.set('n', '<leader>pt', ':NvimTreeFindFileToggle<CR>')
