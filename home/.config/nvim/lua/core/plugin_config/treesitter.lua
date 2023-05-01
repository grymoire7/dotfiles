require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensured_installed = {
		"bash",
		"css",
		"html",
		"json",
		"javascript",
		"lua",
		"markdown",
		"regex",
		"ruby",
		"scss",
		"toml",
		"vue",
		"yaml",
	},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
