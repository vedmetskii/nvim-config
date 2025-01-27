return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  config = function()
	  require('neo-tree').setup()
	  vim.keymap.set("n", "<leader>e", ":Neotree left toggle reveal<CR>")
	end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  }
}
