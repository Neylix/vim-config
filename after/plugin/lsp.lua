local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	'sumneko_lua',
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

lsp.set_preferences({
	sign_icons = {}
})

lsp.setup_nvim_cmp({
	mappings = cmp_mappings,
	sources = {
		{ name = 'git' }
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

	-- Lesser used LSP functionality
	nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	nmap('<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, '[W]orkspace [L]ist Folders')

	-- Create a command `:Format` local to the LSP buffer
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
			vim.lsp.buf.format()
		end, { desc = 'Format current buffer with LSP' })

		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("Format", { clear = true }),
			buffer = bufnr,
			callback = function() vim.lsp.buf.format() end
		})
	end
end)

lsp.setup()

require("cmp_git").setup()

vim.diagnostic.config({
	virtual_text = true
})

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
