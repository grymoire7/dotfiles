-- Mappings with descriptions are defined in lua/core/plugin_config/which-key.lua
-- Mappings specific to plugins are defined in plugin_conifg/* files

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>') -- use <leader>sc instead

-- Spacemacs-like mappings, most moved to plugin_config/which-key.lua
-- vim.keymap.set('n', '<leader>fs', ':w<CR>')
-- vim.keymap.set('n', '<leader>fS', ':wa<CR>')
-- Can't get this one to work with which-key :shrug:
vim.keymap.set('n', '<leader>bb', ':buffers<CR>:buffer<Space>')
-- vim.keymap.set('n', '<leader>bd', ':bdelete<CR>')
-- vim.keymap.set('n', '<leader>bn', ':bn<CR>')
-- vim.keymap.set('n', '<leader>bp', ':bp<CR>')
-- vim.keymap.set('n', '<leader>qq', ':qa<CR>')
-- vim.keymap.set('n', '<leader>qQ', ':qa!<CR>')
-- vim.keymap.set('n', '<leader>sc', ':noh<CR>')
-- vim.keymap.set('n', '<leader>tn', ':set number!<CR>')
-- vim.keymap.set('n', '<leader><TAB>', '<C-^>')
-- vim.keymap.set('n', '<leader>w-', ':sp<CR>')
-- vim.keymap.set('n', '<leader>w/', ':vsp<CR>')
-- vim.keymap.set('n', '<leader>w=', '<C-W>=')
-- vim.keymap.set('n', '<leader>wd', ':q<CR>')
-- vim.keymap.set('n', '<leader>wh', '<C-W>h')
-- vim.keymap.set('n', '<leader>wj', '<C-W>j')
-- vim.keymap.set('n', '<leader>wk', '<C-W>k')
-- vim.keymap.set('n', '<leader>wl', '<C-W>l')
-- vim.keymap.set('n', '<leader>ww', '<C-W><C-W>')

-- Unimplemented
--   'nnoremap':
--    'bR': ':e<CR>',
--    'en': ':lnext<CR>',
--    'ep': ':lprev<CR>',
--    'fed': ':e ~/.vimrc<CR>',
--    'feR': ':source ~/.vimrc<CR>',
--    'ff': ':e <C-R>=substitute(expand("%:p:h"), $HOME, "~", "")<CR>/',
--    'j=': 'mzgg=G`z',
--    'qs': ':xa<CR>',
--    'tl': ':set wrap!<CR>',
--    'ws': '<C-W>s',
--    'wv': '<C-W>v',
--    'ww': '<C-W><C-W>',

-- use ; for :
vim.keymap.set({ "n", "x" }, ";", ":")

vim.keymap.set('i', 'jk', '<Esc>')

-- Because I forget the mode letters:
-- nnoremap jk <esc>         -- Remap in Normal mode
-- inoremap jk <esc>         -- Remap in Insert and Replace mode
-- vnoremap jk <esc>         -- Remap in Visual and Select mode
-- xnoremap jk <esc>         -- Remap in Visual mode
-- snoremap jk <esc>         -- Remap in Select mode
-- cnoremap jk <C-C>         -- Remap in Command-line mode
-- onoremap jk <esc>         -- Remap in Operator pending mode

