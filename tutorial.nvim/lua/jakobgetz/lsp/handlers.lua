local M = {}

local cmp_nvim_lsp = require "cmp_nvim_lsp"

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { text_hl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = true,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev({ boarder = 'rounded' })<CR>", opts)
	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.show_line_diagnostics{ boarder = 'rounded' })<CR>", opts)
	keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next({ boarder = 'rounded' })<CR>", opts)
	keymap(bufnr, "n", "<Leader>q", "<cmd>lua vim.diagnostic.setloclist({ boarder = 'rounded' })<CR>", opts)
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.resolved_capabilites.documentFormattingProvider = false
	end

	if client.name == "sumneko_lua" then
		client.server.capabilities.documentFormattingProvider = false
	end
	
	lsp_keymaps(bufnr)
	local illuminate = require "illuminate"
	illuminate.on_attach(client)
end

return M
