vim.lsp.config.clangd = {
	cmd = { 'clangd' },
	root_markers = { '.clangd', 'compile_commands.json' },
	filetypes = { 'c', 'cpp' }
}

vim.lsp.config.lua_ls = {
	cmd = { 'lua-language-server' },
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		}
	},
	filetypes = { 'lua' }
}

vim.lsp.config.dockerls = {
	cmd = { 'docker-language-server', 'start', '--stdio' },
	filetypes = { 'dockerfile', 'yaml.docker-compose' }
}

vim.lsp.config.rust_analyzer = {
	cmd = { 'rust-analyzer' },
	filetypes = { 'rs' }
}

vim.lsp.config.yamlls = {
	cmd = { 'yaml-language-server', '--stdio' },
	settings = {
		redhat = {
			telemetry = {
				enabled = false
			}
		},
		yaml = {
			shemaStore = {
				enabled = true,
			},
			customTags = {
				"!reference sequence",
			}
		}
	},
	filetypes = { 'yaml', 'yml' }
}

vim.lsp.config.bash = {
	cmd = { 'bash-language-server', 'start' },
	filetypes = { 'sh', 'bash' }
}

vim.lsp.config.pyright = {
	cmd = { 'pyright-langserver', '--stdio' },
	filetypes = { 'python', },
	settings = {
		python = {
			pythonPath = '/usr/bin/python'
		}
	}
}

vim.lsp.enable({ 'lua_ls', 'yamlls', 'bash', 'rust_analyzer', 'clangd', 'pyright', 'dockerls', })

-- lspconfig.emmet_ls.setup({})
-- lspconfig.ts_ls.setup({})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"


		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename Symbol" })
		vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>lf", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
		-- local client = vim.lsp.get_client_by_id(ev.data.client_id)
		-- if client:supports_method('textDocument/completion') then
		-- 	vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		-- end
		-- local triggers = {
		-- 	'a', 'b', 'c', 'd', 'e',
		-- 	'f', 'g', 'h', 'i', 'j',
		-- 	'k', 'l', 'm', 'n', 'o',
		-- 	'p', 'q', 'r', 's', 't',
		-- 	'u', 'v', 'w', 'x', 'y',
		-- 	'z',
		-- 	'A', 'B', 'C', 'D', 'E',
		-- 	'F', 'G', 'H', 'I', 'J',
		-- 	'K', 'L', 'M', 'N', 'O',
		-- 	'P', 'Q', 'R', 'S', 'T',
		-- 	'U', 'V', 'W', 'X', 'Y',
		-- 	'Z'
		-- }
		-- vim.api.nvim_create_autocmd('InsertCharPre', {
		-- 	buffer = vim.api.nvim_get_current_buf(),
		-- 	callback = function()
		-- 		if vim.fn.pumvisible() == 1 or vim.fn.state('m') == 'm' then
		-- 			return
		-- 		end
		-- 		local char = vim.v.char
		-- 		if vim.list_contains(triggers, char) then
		-- 			local key = vim.keycode('<C-x><C-n>')
		-- 			vim.api.nvim_feedkeys(key, 'm', false)
		-- 		end
		-- 	end
		-- })
	end,
})
