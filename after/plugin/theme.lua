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
require('onedark').load()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
	char = '┊',
	show_trailing_blankline_indent = false
}

local whitespace_color = vim.fn.synIDattr(vim.fn.hlID('Whitespace'), 'fg')
vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = whitespace_color, nocombine = true })
