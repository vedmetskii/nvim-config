return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	config = function()
		require('neo-tree').setup({
			filesystem = {
				filtered_items = {
					visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
					hide_dotfiles = false,
					hide_gitignored = true,
				},
			}
		})
		vim.keymap.set("n", "<leader>e", ":Neotree left toggle reveal<CR>")
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
	}
}
