local M = {}
function M.config()
  -- Formatting and linting
  -- https://github.com/jose-elias-alvarez/null-ls.nvim
  local status_ok, null_ls = pcall(require, "null-ls")
  if not status_ok then
    return
  end

  -- Check supported formatters
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  local formatting = null_ls.builtins.formatting

  -- Check supported linters
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup {
    debug = false,
    sources = {
      -- Set a formatter
      formatting.rufo,
      formatting.markdownlint,
      formatting.prettier.with { extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } },
      formatting.black.with { extra_args = { "--fast" } },
      formatting.stylua,
      -- Set a linter
      diagnostics.rubocop,
      diagnostics.markdownlint,
      diagnostics.flake8,
      -- diagnostics.eslint,
    },
    -- NOTE: You can remove this on attach function to disable format on save
    on_attach = function(client)
      -- if client.resolved_capabilities.document_formatting then
      -- vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
      -- end
    end,
  }
end

return M
