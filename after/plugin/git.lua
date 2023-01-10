-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
	signs = {
		add = { text = '+' },
		change = { text = '~' },
		delete = { text = '_' },
		topdelete = { text = '‾' },
		changedelete = { text = '~' },
	},
}

-- Octo PR reviewer
require('octo').setup()

-- keymap for conflict resolution using git fugitive
vim.keymap.set('n', 'gdh', ':diffget //2<cr>')
vim.keymap.set('n', 'gdl', ':diffget //3<cr>')
