return {
	{
		"williamboman/mason.nvim",
		config = function()
			require('mason').setup()
		end
	},
	{
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require("mason-lspconfig").setup(
				{
					ensure_installed = {
						"helm_ls",
						"lua_ls",
						"rust_analyzer",
						"gopls",
						"pyright",
						"gitlab_ci_ls",
						"yamlls",
						"ts_ls",
						"clangd",
						"dockerls",
						"docker_compose_language_service",
					}
				})
		end
	}
}
