local remap = function(keys, func, desc)
	if desc then
		desc = 'LSP: ' .. desc
	end

	vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end

local on_attach = function(client, bufnr)
	remap('<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')
	remap('<leader>ca', vim.lsp.buf.code_action, '[c]ode [a]ction')

	remap('gd', vim.lsp.buf.definition, '[g]oto [d]efinition')
	remap('gr', require('telescope.builtin').lsp_references, '[g]oto [r]eferences')
	remap('gI', require('telescope.builtin').lsp_implementations, '[g]oto [I]mplementation')
	remap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
	remap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[d]ocument [s]ymbols')
	remap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[w]orkspace [s]ymbols')

	-- See `:help K` for why this keymap
	remap('<leader>k', vim.lsp.buf.hover, 'Hover Documentation')
	remap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

	-- Lesser used LSP functionality
	remap('gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')
	remap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[w]orkspace [a]dd Folder')
	remap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[w]orkspace [r]emove Folder')
	remap('<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, '[w]orkspace [l]ist Folders')

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
	clangd = {},
	sqlls = {},
	pylsp = {
		pylsp = {
			plugins = {
				jedy = { environment = "./venv/" },
				-- `PylspInstall python-lsp-ruff`
				ruff = { enabled = true, extendSelect = { "I", "B" }, lineLength = 88 },
				-- `:PylspInstall pylsp-mypy`
				mypy = { enabled = true },
				pycodestyle = { maxLineLength = 88 },
				yapf = { enabled = false },
				autopep8 = { enabled = false },
			}
		}
	},

	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup {
	ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
	function(server_name)
		require('lspconfig')[server_name].setup {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
			filetypes = (servers[server_name] or {}).filetypes,
		}
	end,
}
