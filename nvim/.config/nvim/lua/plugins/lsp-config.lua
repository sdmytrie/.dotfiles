return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruff = {
        mason = false,
        enabled = false,
      },
    },
  },
}
