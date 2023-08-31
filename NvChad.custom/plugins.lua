local plugins = {
  -- plugins in development by me
  {
    "jakobgetz/wat-the-wasm.nvim",
    dev = "true",
    ft = "wat",
    config = function()
      require "wat-the-wasm".setup()
    end,
  },

  --- file explorer
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "Oil" },
    config = function()
      require "oil".setup({
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
        }
      })
    end
  },
  -- Language Server
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Language Servers
        "rust-analyzer",
        "typescript-language-server",
        "html-lsp",
        -- Debug Adapters
        "codelldb",
      },
    },
  },
  -- Syntax highligting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "c",
        "rust",
        "bash",
        "cpp",
        "dockerfile",
        "gitignore",
        "java",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "toml",
        "xml",
        "yaml",
      }
    }
  },
  -- Debugger
  {
    "mfussenegger/nvim-dap",
    lazy = false,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    lazy = false,
  },
  -- Misc
  {
    "RaafatTurki/hex.nvim",
    cmd = { "HexToggle", "HexDumb", "HexAssemble" },
    -- config = function()
    --   require "hex".setup()
    -- end,
  }
}

return plugins
