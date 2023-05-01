require("core.plugin_config.mason")
-- require("core.plugin_config.colorscheme")
-- require("core.plugin_config.lualine")
require("core.plugin_config.nvim-tree")
require("core.plugin_config.treesitter")
require("core.plugin_config.telescope")
-- require("core.plugin_config.vim-test")
require("core.plugin_config.gruvbox")
require("core.plugin_config.which-key")
require("core.plugin_config.completions")
require("core.plugin_config.lspconfig")
-- require("core.plugin_config.gitsigns")
-- require("core.plugin_config.copilot")

-- Set theme (move to colorscheme.lua)
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
--- vim.cmd("colorscheme kanagawa")

