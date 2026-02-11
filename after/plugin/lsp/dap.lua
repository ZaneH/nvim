local dap = require("dap")
local dapui = require("dapui")

dapui.setup({
	layouts = {
		{
			elements = {
				{ id = "scopes", size = 0.33 },
				{ id = "breakpoints", size = 0.17 },
				{ id = "stacks", size = 0.25 },
				{ id = "watches", size = 0.25 },
			},
			position = "right",
			size = 50,
		},
		{
			elements = { "repl", "console" },
			position = "bottom",
			size = 10,
		},
	},
})

dap.listeners.after.event_initialized["dapui"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui"] = function()
	dapui.close()
end

local codelldb_path = os.getenv("CODELLDB")

if codelldb_path and codelldb_path ~= "" then
	dap.adapters.codelldb = {
		type = "server",
		port = "${port}",
		executable = {
			command = codelldb_path,
			args = { "--port", "${port}" },
		},
	}
end

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dB", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Conditional breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue/Start" })
vim.keymap.set("n", "<leader>dn", dap.step_over, { desc = "Step over" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step out" })
vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
vim.keymap.set("n", "<leader>de", function()
	dapui.eval(vim.fn.expand("<cWORD>"), { enter = true })
end, { desc = "Eval under cursor" })
