---@type ChadrcConfig 
local M = {}
M.ui = { theme = 'gruvbox_light' }
M.lazy_nvim = {
  dev = {
    path = "~/repos/"
  }
}
M.mappings = require "custom.mappings"
M.plugins = 'custom.plugins'
-- vim.opt.statuscolumn = "%3l  %r  "
-- vim.opt.relativenumber = true
-- vim.opt.signcolumn = "number"
vim.opt.scrolloff = 8
vim.opt.incsearch = true
return M
