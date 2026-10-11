
-- ============================================================
-- AUTOFORMATTING & LINTING
-- none-ls (formatters/linters as an LSP), installed via Mason
-- ============================================================
do
  local function gh(repo) return 'https://github.com/' .. repo end

  vim.pack.add {
    gh 'nvimtools/none-ls.nvim',
    gh 'nvimtools/none-ls-extras.nvim', -- provides the ruff sources
    gh 'jay-babu/mason-null-ls.nvim',
  }

  local null_ls = require 'null-ls'
  local formatting = null_ls.builtins.formatting -- to setup formatters
  local diagnostics = null_ls.builtins.diagnostics -- to setup linters

  -- Formatters & linters for mason to install
  require('mason-null-ls').setup {
    ensure_installed = {
      'prettier', -- html/json/yaml/markdown formatter
      'shfmt', -- Shell formatter
      'checkmake', -- linter for Makefiles
      'stylua', -- lua formatter
      'ruff', -- Python linter and formatter
    },
    automatic_installation = true,
  }

  local sources = {
    diagnostics.checkmake,
    formatting.prettier.with { filetypes = { 'html', 'json', 'yaml', 'markdown' } },
    formatting.stylua,
    formatting.shfmt.with { args = { '-i', '4' } },
    -- formatting.terraform_fmt, -- needs the `terraform` binary installed
    require('none-ls.formatting.ruff').with { extra_args = { '--extend-select', 'I' } },
    require 'none-ls.formatting.ruff_format',
  }

  local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
  null_ls.setup {
    -- debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
    sources = sources,
    on_attach = function(client, bufnr)
      if client:supports_method 'textDocument/formatting' then
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = augroup,
          buffer = bufnr,
          callback = function()
            -- Only let none-ls format, so other LSPs (and the stylua LSP) don't format the file a second time
            vim.lsp.buf.format {
              bufnr = bufnr,
              async = false,
              filter = function(c) return c.name == 'null-ls' end,
            }
          end,
        })
      end
    end,
  }
end
