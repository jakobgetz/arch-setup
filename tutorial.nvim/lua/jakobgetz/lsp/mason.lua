local servers = {
	"lua_ls",
	"jsonls",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require "mason".setup(settings)
require "mason-lspconfig".setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig = require "lspconfig"

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require "jakobgetz.lsp.handlers".on_attach,
		capabilities = require "jakobgetz.lsp.handlers".capabilities,
	}

	server = vim.split(server, "@")[1]

	local conf_opts = require("jakobgetz.lsp.settings." .. server)
	opts = vim.tbl_deep_extend("force", conf_opts, opts)

	lspconfig[server].setup(opts)
end
