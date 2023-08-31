-- Setup lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
local plugins = {
	-- colorschemes
	"lunarvim/colorschemes",                -- some extra color schemes
	"folke/tokyonight.nvim",

	-- completion plugins
	"hrsh7th/nvim-cmp",                     -- the completion plugin
	"hrsh7th/cmp-buffer",                   -- buffer completions
	"hrsh7th/cmp-path",                     -- path completions
	"hrsh7th/cmp-cmdline",                  -- commandline completions
	"saadparwaiz1/cmp_luasnip",             -- snippet completions
	"hrsh7th/cmp-nvim-lsp",                 -- lsp completions

	-- snippets
	"L3MON4D3/LuaSnip",                     -- snippet engine
	"rafamadriz/friendly-snippets",         -- a bunch of snippets to use

	-- LSP
    "neovim/nvim-lspconfig",                -- enable LSP
	"williamboman/mason.nvim",              -- simple to use lsp installer
	"jose-elias-alvarez/null-ls.nvim",      -- for formatters and linters
	"williamboman/mason-lspconfig.nvim",
	"RRethy/vim-illuminate",

	-- misc
	"RaafatTurki/hex.nvim",                 -- hex editor
	"nvim-lua/plenary.nvim"                  -- useful lua functions used by a lot of plugins
}
require("lazy").setup(plugins, opts)
