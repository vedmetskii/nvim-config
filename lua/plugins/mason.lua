return {
    "williamboman/mason.nvim",
	event = "VimEnter",
	config = function ()
		require("mason").setup()
	end,
	keys = {
		{
			"<leader>M",
			"<cmd>Mason<CR>",
			desc = "Open Mason window"
		},
	}
}
