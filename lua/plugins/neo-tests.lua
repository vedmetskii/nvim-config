return {
	"nvim-neotest/neotest",
	config = function ()
		require("neotest").setup({
			summary = {
				open = "botright vsplit | vertical resize 40",
			},
			adapters = {
				require("neotest-python")({
					dap = { justMyCode = false },
				}),
				require("neotest-rust")({
					dap_adapter = "gdb"
				})
				-- require("neotest-plenary"),
				-- require("neotest-vim-test")({
				-- 	ignore_file_types = { "python", "vim", "lua" },
				-- }),
			},
		})
	end,
	keys = {
		{
			"<leader>tr",
			  "<cmd>lua require('neotest').run.run()<cr>",
			  desc = "Run nearest test",
		  },
		  {
			  "<leader>tf",
			  "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
			  desc = "Run current file",
		  },
		  {
			  "<leader>ta",
			  "<cmd>lua require('neotest').run.run({ suite = true })<cr>",
			  desc = "Run all tests",
		  },
		  {
			  "<leader>td",
			  "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
			  desc = "Debug nearest test",
		  },
		  {
			  "<leader>ts",
			  "<cmd>lua require('neotest').run.stop()<cr>",
			  desc = "Stop test",
		  },
		  {
			  "<leader>tn",
			  "<cmd>lua require('neotest').run.attach()<cr>",
			  desc = "Attach to nearest test",
		  },
		  {
			  "<leader>to",
			  "<cmd>lua require('neotest').output.open()<cr>",
			  desc = "Show test output",
		  },
		  {
			  "<leader>tp",
			  "<cmd>lua require('neotest').output_panel.toggle()<cr>",
			  desc = "Toggle output panel",
		  },
		  {
			  "<leader>tv",
			  "<cmd>lua require('neotest').summary.toggle()<cr>",
			  desc = "Toggle summary",
		  },
	},
	dependencies = {
		"nvim-neotest/neotest-python",
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"rouge8/neotest-rust"
	}
}
