-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`

local ft_to_parser = require "nvim-treesitter.parsers".filetype_to_parsername
ft_to_parser.octo = "markdown"

require('nvim-treesitter.configs').setup {
	-- Add languages to be installed here that you want installed for treesitter
	ensure_installed = { 'bash', 'json', 'heex', 'html', 'markdown', 'yaml', 'erlang', 'vim', 'elixir', 'javascript', 'c',
		'go', 'lua', 'python', 'rust', 'typescript', 'help' },

	highlight = { enable = true, disable = { "html" }, additional_vim_regex_hightlighting = false },
	indent = { enable = true, disable = { 'python' } },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<c-space>',
			node_incremental = '<c-space>',
			scope_incremental = '<c-s>',
			node_decremental = '<c-backspace>',
		},
	},
	textobjects = {
		swap = {
			enable = true,
			swap_next = {
				['<leader>a'] = '@parameter.inner',
			},
			swap_previous = {
				['<leader>A'] = '@parameter.inner',
			},
		},
	},
}
