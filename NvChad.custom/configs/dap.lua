local dap = require("dap")
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = "~/.local/share/NvChad.nvim/mason/bin/codelldb",
    args = "--port ${port}",
  }
}

dap.configurations.rust = {
  name = "Launch Rust Application",
  type = "codelldb",
  request = "launch",
  program = function()
    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
  end,
  cwd = "${workspaceFolder}",
}
