-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
	options = {
		icons_enabled = false,
		theme = 'onedark',
		component_separators = '|',
		section_separators = '',
	},
}

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme onedark]]
