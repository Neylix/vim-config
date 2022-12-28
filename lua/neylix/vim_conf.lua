-- See `:help vim.o`

-- Make line numbers default
vim.wo.number = true
-- Make relative number
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Set autocopy with OS clipboard
vim.o.clipboard = 'unnamedplus'

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

vim.o.scrolloff = 8

vim.o.incsearch = true

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})

-- Auto resize split when window os resized
vim.api.nvim_create_autocmd('VimResized', { command = 'wincmd =' })
