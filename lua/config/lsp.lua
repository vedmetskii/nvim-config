vim.lsp.config.lua_ls = require("config.lsp.lua_ls")
vim.lsp.config.clangd = require("config.lsp.clangd")
vim.lsp.config.docker_compose_langserver = require("config.lsp.docker_compose_langserver")
vim.lsp.config.rust_analyzer = require("config.lsp.rust_analyzer")
vim.lsp.config.yamlls = require("config.lsp.yamlls")
vim.lsp.config.phpactor = require("config.lsp.phpactor")
vim.lsp.config.bash = require("config.lsp.bash")
vim.lsp.config.ruff = require("config.lsp.ruff")
vim.lsp.config.pyright = require("config.lsp.pyright")

-- vim.lsp.enable('ruff')
vim.lsp.enable('pyright')
vim.lsp.enable('clangd')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('bash')
vim.lsp.enable('yamlls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('phpactor')
vim.lsp.enable('docker_compose_langserver')

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
	end,
})
