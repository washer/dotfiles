local map = require("config.map")
local dap = require("dap")
local dap_widgets = require("dap.ui.widgets")
local utils = require("dap.utils")
local dapui = require("dapui")
local vscode_js_debug_path = vim.fn.stdpath("data") .. "/mason/packages/vscode-js-debug/js-debug-adapter"

dapui.setup({})

for _, language in ipairs({ "typescript", "javascript" }) do
	dap.configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch Server",
			runtimeExecutable = "npm",
			runtimeArgs = { "run", "start-env" },
			skipFiles = { "node_modules/**" },
			console = "integratedTerminal",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach to process ID",
			processId = utils.pick_process,
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Debug Jest Tests",
			-- trace = true, -- include debugger info
			runtimeExecutable = "node",
			runtimeArgs = {
				"./node_modules/jest/bin/jest.js",
				"--runInBand",
			},
			rootPath = "${workspaceFolder}",
			cwd = "${workspaceFolder}",
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
		},
	}
end

map.leader("n", "db", dap.toggle_breakpoint, "Toggle breakpoint")
map.leader("n", "dd", dap.clear_breakpoints, "Clear breakpoints")
map.leader("n", "dc", dap.continue, "Continue")
map.leader("n", "do", dap.step_over, "Step over")
map.leader("n", "di", dap.step_into, "Step into")
map.leader("n", "du", dap.step_out, "Step out")
map.leader("n", "dr", dap.repl.open, "Open REPL")
map.leader("n", "ds", dap.terminate, "Terminate")
map.leader("n", "dt", '<cmd>lua require("dapui").toggle()<cr>', "Toggle UI")
dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close
dap.adapters["pwa-node"] = {
	type = "server",
	host = "localhost",
	port = "${port}",
	executable = {
		command = "node",
		args = {
			vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
			"${port}",
		},
	},
}
