local map = require("config.map")
local dap = require("dap")
local dap_widgets = require("dap.ui.widgets")

require("dapui").setup()

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

require("dap-vscode-js").setup({
	debugger_path = vim.fn.expand("~/vscode-js-debug"),
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
	log_file_path = "(stdpath cache)/dap_vscode_js.log",
	log_file_level = false,
	log_console_level = vim.log.levels.ERROR,
})
