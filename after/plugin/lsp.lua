local lsp = require('lsp-zero')

lsp.preset({
	name = 'recommended',
	set_lsp_keymaps = { preserve_mappings = false, omit = {} },
	sign_icons = {}
})

lsp.ensure_installed({
	'lua_ls',
	'elixirls',
	'erlangls'
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-Space>'] = cmp.mapping.complete(),
	['<CR>'] = cmp.mapping.confirm {
		behavior = cmp.ConfirmBehavior.Replace,
		select = true,
	},
	['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
	['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
})

lsp.setup_nvim_cmp({
	mappings = cmp_mappings,
	sources = {
		{ name = 'git' },
		{ name = 'path' },
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
	}
})

lsp.on_attach(function(client, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc, remap = false })
	end

	nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
	nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
	nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

	-- Create a command `:Format` local to the LSP buffer
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
			vim.lsp.buf.format()
		end, { desc = 'Format current buffer with LSP' })

		vim.api.nvim_create_autocmd("BufWritePre *", {
			group = vim.api.nvim_create_augroup("Format", { clear = true }),
			buffer = bufnr,
			callback = function() vim.lsp.buf.format() end
		})
	end
end)

lsp.nvim_workspace()

lsp.setup()

require("cmp_git").setup()

vim.diagnostic.config({
	virtual_text = true
})

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
