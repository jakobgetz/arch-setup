local M = {}

M.abc = {
  n = {
    -- Move text up and down
    ["<A-j>"] = { "<CMD>m .+1<CR>==" },
    ["<A-k>"] = { "<CMD>m .-2<CR>==" },
    -- Resize with arrows
    ["<C-Up>"] = { "<CMD>resize -2<CR>" },
    ["<C-Down>"] = { "<CMD>resize +2<CR>" },
    ["<C-Left>"] = { "<CMD>vertical resize -2<CR>" },
    ["<C-Right>"] = { "<CMD>vertical resize +2<CR>" },
    -- Move through buffers
    ["<S-h>"] = { "<CMD>bprevious<CR>" },
    ["<S-l>"] = { "<CMD>bnext<CR>" },
    -- Oil.nvim filemanager
    ["<leader>e"] = { "<CMD>Oil<CR>" },
    -- WatTheWasm
    ["<A-q>"] = { "<CMD>Wat2Wasm<CR>" },
    ["<A-w>"] = { "<CMD>WatTheWasm<CR>" },
    ["<A-e>"] = { "<CMD>Wat2Wat<CR>" },
    ["<A-r>"] = { "<CMD>WatRevert<CR>" },
  },
  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true }},
    ["kj"] = { "<ESC>", "escape insert mode", opts = { nowait = true }},
  },
  v = {
    ["jk"] = { "<ESC>", "escape visual mode", opts = { nowait = true }},
    ["kj"] = { "<ESC>", "escape visual mode", opts = { nowait = true }},
  },
}

return M
