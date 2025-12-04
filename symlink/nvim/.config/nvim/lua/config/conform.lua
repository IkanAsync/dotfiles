local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "prettier" },
		html = { "prettier" },
		go = { "goimports" },
		python = { "black" },
		vue = { "prettier" },
		htmldjango = { "djlint" },
		zig = { "zls" },
		nix = { "nixfmt" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 1000,
		lsp_fallback = true,
	},
})

local mason_tools = {}
for _, formatters in pairs(conform.formatters_by_ft) do
	for _, f in ipairs(formatters) do
		table.insert(mason_tools, f)
	end
end

require("mason").setup()
require("mason-tool-installer").setup({
	ensure_installed = mason_tools,
	run_on_start = true,
})
