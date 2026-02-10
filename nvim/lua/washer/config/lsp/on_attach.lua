local lsp_on_attach = {}

local lsp_methods = {
	definition = vim.lsp.buf.definition,
	declaration = vim.lsp.buf.declaration,
	hover = vim.lsp.buf.hover,
	type_definition = vim.lsp.buf.type_definition,
	formatting = lsp_format_wrapper,
	signature_help = vim.lsp.buf.signature_help,
	document_symbol = vim.lsp.buf.document_symbol,
	code_action = vim.lsp.buf.code_action,
	rename = vim.lsp.buf.rename,
	references = vim.lsp.buf.references,
}

---Jump to an lsp result in a split window or select between results if there
---is more than one
---@param lsp_method string
---@param split_cmd string
---@param selector 'fzf' | 'quickfix'
---@return function
local function lsp_request_jump(lsp_method, split_cmd, selector)
	return function()
		local params = vim.lsp.util.make_position_params(0)

		-- TODO: Use buf_request_sync instead?
		vim.lsp.buf_request_all(0, lsp_method, params, function(results)
			local clients = vim.tbl_keys(results)

			if #clients == 0 then
				return
			elseif #clients == 1 then
				local client = vim.lsp.get_client_by_id(clients[1])

				if results[client.id] and results[client.id].result and #results[client.id].result > 0 then
					vim.cmd(split_cmd)
					vim.lsp.util.jump_to_location(results[client.id].result[1], client.offset_encoding, false)
					vim.cmd("normal zt")
				end
			else
				local locations = {}

				for client_id, result in pairs(results) do
					local client = vim.lsp.get_client_by_id(client_id)
					local items = vim.lsp.util.locations_to_items(result.result, client.offset_encoding)

					vim.list_extend(locations, items)
				end

				vim.fn.setqflist({}, " ", { items = locations })
				vim.cmd("copen")
			end
		end)
	end
end

function lsp_on_attach.on_attach(event)
	local client = vim.lsp.get_client_by_id(event.data.client_id)
	local buffer = event.buf

	if client.server_capabilities.completionProvider then
		vim.bo[buffer].omnifunc = "v:lua.vim.lsp.omnifunc"
	end

	-- Set up a document symbol mapping if the mapping is not already bound (by e.g. fzf-lua)
	if vim.fn.maparg("<c-s>", "n") == "" then
		vim.keymap.set("n", "<c-s>", lsp_methods.document_symbol)
	end

	local lsp_method = "textDocument/definition"
	local selector = "quickfix"

	vim.keymap.set("n", "<leader>i", lsp_methods.hover)
	-- Enable completion triggered by <c-x><c-o>
	vim.keymap.set("n", "gd", lsp_methods.definition)
	vim.keymap.set("n", "<leader>aa", lsp_methods.code_action)
end

return lsp_on_attach
