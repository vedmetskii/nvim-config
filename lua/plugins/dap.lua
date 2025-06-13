return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	config = function ()
		local dap = require("dap")
		local ui = require("dapui")
		dap.configurations = {
			c = {
				{
					name = "Launch file",
					type = "cppdbg",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopAtEntry = false,
					MIMode = "lldb",
				},
				{
					name = "Attach to lldbserver :1234",
					type = "cppdbg",
					request = "launch",
					MIMode = "lldb",
					miDebuggerServerAddress = "localhost:1234",
					miDebuggerPath = "/usr/bin/lldb",
					cwd = "${workspaceFolder}",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
				},
			},
			rust = {
				{
					name = "Launch file",
					type = "lldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopAtEntry = false,
					MIMode = "lldb",
				},
				{
					name = "Attach to lldbserver :1234",
					type = "lldb",
					request = "launch",
					MIMode = "lldb",
					miDebuggerServerAddress = "localhost:1234",
					miDebuggerPath = "/usr/bin/lldb",
					cwd = "${workspaceFolder}",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
				},
				{
					name = "Launch file",
					type = "cppdbg",
					request = "launch",
					program = function()
					  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
					end,
					cwd = '${workspaceFolder}',
					stopAtEntry = true,
				},
				{
					name = 'Attach to gdbserver :1234',
					type = 'cppdbg',
					request = 'launch',
					MIMode = 'gdb',
					miDebuggerServerAddress = 'localhost:1234',
					miDebuggerPath = '/usr/bin/gdb',
					cwd = '${workspaceFolder}',
					program = function()
					  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
					end,
				},
			}
		}

		-- Dap UI

		ui.setup()

		vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

		dap.listeners.before.attach.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			ui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			ui.close()
		end
	end,
	keys = {
		  -- Debugger
		  {
			  "<leader>d",
			  group = "Debugger",
			  nowait = true,
			  remap = false,
		  },
		  {
			  "<leader>dt",
			  function()
				  require("dap").toggle_breakpoint()
			  end,
			  desc = "Toggle Breakpoint",
			  nowait = true,
			  remap = false,
		  },
		  {
			  "<leader>dc",
			  function()
				  require("dap").continue()
			  end,
			  desc = "Continue",
			  nowait = true,
			  remap = false,
		  },
		  {
			  "<leader>di",
			  function()
				  require("dap").step_into()
			  end,
			  desc = "Step Into",
			  nowait = true,
			  remap = false,
		  },
		  {
			  "<leader>do",
			  function()
				  require("dap").step_over()
			  end,
			  desc = "Step Over",
			  nowait = true,
			  remap = false,
		  },
		  {
			  "<leader>du",
			  function()
				  require("dap").step_out()
			  end,
			  desc = "Step Out",
			  nowait = true,
			  remap = false,
		  },
		  {
			  "<leader>dr",
			  function()
				  require("dap").repl.open()
			  end,
			  desc = "Open REPL",
			  nowait = true,
			  remap = false,
		  },
		  {
			  "<leader>dl",
			  function()
				  require("dap").run_last()
			  end,
			  desc = "Run Last",
			  nowait = true,
			  remap = false,
		  },
		  {
			  "<leader>dq",
			  function()
				  require("dap").terminate()
				  require("dapui").close()
			  end,
			  desc = "Terminate",
			  nowait = true,
			  remap = false,
		  },
		  {
			  "<leader>db",
			  function()
				  require("dap").list_breakpoints()
			  end,
			  desc = "List Breakpoints",
			  nowait = true,
			  remap = false,
		  },
		  {
			  "<leader>de",
			  function()
				  require("dap").set_exception_breakpoints({ "all" })
			  end,
			  desc = "Set Exception Breakpoints",
			  nowait = true,
			  remap = false,
		  },
	},
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text",
    },
}
