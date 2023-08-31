local opts = {
	noremap = true,
	silent = true,
}

-- Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- Modes
--     normal mode = "n"
--     insert mode = "i"
--     visual mode = "v"
--     visual block mode = "x"
--     term mode = "t"
--     command mode = "c"

-- Normal Mode
-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<leader>e", ":Lex 30<cr>", opts)
-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
-- Move text up and down
vim.keymap.set("n", "<A-k>", ":m -2<CR>", opts)
vim.keymap.set("n", "<A-j>", ":m +1<CR>", opts)
