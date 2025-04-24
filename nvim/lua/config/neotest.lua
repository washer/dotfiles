local neotest = require("neotest")
local map = require("config.map")

---@param path string
---@return boolean
local function is_integration_test(path)
	return path:match(".it.[tj]s$")
end

---@return string
local function get_cwd()
	return vim.fn.getcwd()
end

neotest.setup({
	lazy = false,
	icons = {
		failed = "x",
		passed = "✓",
		running = "",
		skipped = "",
		unknown = "?",
		watching = "👀",
	},
	output_panel = {
		open = "vs",
		-- open = function()
		-- 	local screen_w = vim.opt.columns:get()
		-- 	vim.cmd("")
		-- end,
		-- close = function()
		-- 	vim.cmd("FloatermToggle --name testoutput")
		-- end,
	},
	output = {
		enabled = true,
	},
	diagnostic = {
		enabled = true,
	},
	adapters = {
		require("neotest-jest")({
			jestCommand = function(path)
				local cwd = get_cwd()

				if vim.endswith(cwd, "api") or vim.endswith(cwd, "mailman") then
					if is_integration_test(path) then
						return "npm run test:integration -- "
					elseif path:match(".render.test.ts$") then
						return "npm run test-render --"
					else
						return "npm run test:unit --"
					end
				end

				return "npm test --"
			end,
			cwd = get_cwd,
			extension_test_file_match = require("neotest-jest.util").create_test_file_extensions_matcher(
				{ "test", "it" },
				{ "js", "ts" }
			),
			jest_test_discovery = true,
		}),
	},
})

-- map.leader("n", "tf", '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>', "Run tests in file")
map.leader("n", "tf", function()
	local buf = vim.fn.bufnr("Neotest Output Panel")
	if buf ~= -1 then
		-- require("neotest").output_panel.clear()
		require("neotest").run.run(vim.fn.expand("%"))
	else
		require("neotest").output_panel.open()
		require("neotest").run.run(vim.fn.expand("%"))
	end
end, "Run tests in file")
map.leader("n", "tt", function()
	-- Toggle trouble and test summary
	require("trouble").toggle("diagnostics")
	require("neotest").summary.toggle()
end, "Toggle test UI")
map.leader("n", "tn", '<cmd>lua require("neotest").run.run({strategy = "dap"})<cr>', "Run nearest test")
map.leader("n", "twf", '<cmd>lua require("neotest").watch.watch(vim.fn.expand("%"))<cr>', "Watch tests in file")
map.leader("n", "twn", '<cmd>lua require("neotest").watch.watch()<cr>', "Watch nearest test")
map.leader("n", "tws", '<cmd>lua require("neotest").watch.stop()<cr>', "Stop watching all tests")
map.leader("n", "ts", '<cmd>lua require("neotest").summary.toggle()<CR>', "Toggle summary")
map.leader("n", "to", '<cmd>lua require("neotest").output_panel.toggle()<CR>', "Open test output")
