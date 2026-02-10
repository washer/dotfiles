local neotest = require("neotest")

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
	-- lazy = false,
	icons = {
		failed = "x",
		passed = "✓",
		running = "",
		skipped = "",
		unknown = "?",
		watching = "👀",
	},
	-- output_panel = {
	-- open = "vs",
	-- open = function()
	-- 	local screen_w = vim.opt.columns:get()
	-- 	vim.cmd("")
	-- end,
	-- close = function()
	-- 	vim.cmd("FloatermToggle --name testoutput")
	-- end,
	-- },
	-- output = {
	-- 	enabled = true,
	-- },
	-- diagnostic = {
	-- 	enabled = true,
	-- },
	adapters = {
		require("neotest-jest")({
			jestCommand = function(path)
				local cwd = get_cwd()

				if vim.endswith(cwd, "/api") or vim.endswith(cwd, "/mailman") then
					if path:match(".it.[tj]s$") then
						return "npm run test:integration -- "
					elseif path:match(".render.test.ts$") then
						return "npm run test:render --"
					else
						return "npm run test:unit --"
					end
				end

				return "npm test --"
			end,
			jest_test_discovery = true,
			cwd = get_cwd,
			isTestFile = function(file_path)
				if require("neotest-jest.jest-util").defaultIsTestFile(file_path) then
					return true
				end

				local ext = vim.fn.fnamemodify(file_path, ":e:e")

				return ext == "it.ts" and require("neotest-jest.jest-util").hasJestDependency(file_path)
			end,
			strategy_config = function(default_strategy, _)
				default_strategy["resolveSourceMapLocations"] = {
					"${workspaceFolder}/**",
					"!**/node_modules/**",
				}

				return default_strategy
			end,
			-- extension_test_file_match = require("neotest-jest.util").create_test_file_extensions_matcher(
			-- 	{ "test", "it" },
			-- 	{ "js", "ts" }
			-- ),
		}),
	},
})

vim.keymap.set("n", "<leader>tt", function()
	neotest.run.run()
end)
vim.keymap.set("n", "<leader>tf", function()
	neotest.run.run(vim.fn.expand("%"))
end)
vim.keymap.set("n", "<leader>ts", function()
	require("neotest").summary.toggle()
end)
vim.keymap.set("n", "<leader>tn", '<cmd>lua require("neotest").run.run({strategy = "dap"})<cr>')
vim.keymap.set("n", "<leader>to", '<cmd>lua require("neotest").output_panel.toggle()<CR>')
