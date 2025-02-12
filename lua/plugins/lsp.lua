return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require('lspconfig')
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					runtime = {
						version = 'LuaJIT',
					},
					diagnostics = {
						globals = {
							'vim',
							'require'
						},
					},
				}
			}
		})
		lspconfig.rust_analyzer.setup({
			settings = {
				['rust-analyzer'] = {},
			},
		})
		lspconfig.emmet_ls.setup({})
		lspconfig.gitlab_ci_ls.setup({})
		lspconfig.dockerls.setup({})
		lspconfig.docker_compose_language_service.setup({})
		lspconfig.pyright.setup({})
		lspconfig.clangd.setup {}
		lspconfig.helm_ls.setup({
			settings = {
				['helm-ls'] = {
					yamlls = {
						path = "yaml-language-server",
					}
				}
			}
		})
		lspconfig.yamlls.setup({
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
			}
		})
		lspconfig.ts_ls.setup({})

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
	end
}
