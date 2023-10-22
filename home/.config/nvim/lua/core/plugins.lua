local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
  'nvim-lualine/lualine.nvim',
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'nvim-treesitter/nvim-treesitter',
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
      })
    end,
  },
  'lewis6991/gitsigns.nvim',

  'kdheepak/lazygit.nvim',             -- git wrapper
  'tpope/vim-fugitive',                -- git wrapper

  -- completion
  {
    'hrsh7th/nvim-cmp',                -- completion plugin (lua)
    dependencies = {
      'rafamadriz/friendly-snippets',  -- a collection of snippets
      'L3MON4D3/LuaSnip',              -- snippet manager
    },
  },
  'hrsh7th/cmp-nvim-lsp',              -- nvim-cmp source for built-in lsp client
  -- 'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',          -- nvim-cmp source for luasnip
  -- "rafamadriz/friendly-snippets",
  "github/copilot.vim",                -- github ai helper
  "williamboman/mason.nvim",           -- lsp package manager
  "neovim/nvim-lspconfig",             -- a collection of lsp configs
  "williamboman/mason-lspconfig.nvim", -- lsp config data for mason
  "glepnir/lspsaga.nvim",              -- popup look and feel niceties
  {
	  'nvim-telescope/telescope.nvim',   -- fuzzy finder
	  tag = '0.1.1',
	  dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                work = "~/notes/work",
                home = "~/notes/home",
              },
            },
          },
        },
      }
    end,
  },
}

local opts = {}

require("lazy").setup(plugins, opts)
