vim.pack.add {
	{ src =
	'https://github.com/nvim-treesitter/nvim-treesitter'
},
  }
  -- Tree-sitter parser for Rust (run :TSInstall rust once)
  -- LSP for rust-analyzer
  vim.lsp.config('rust_analyzer', {
	  cmd = { 'rust-analyzer' },
	  filetypes = { 'rust' },
	  root_markers = { 'Cargo.toml', '.git' },
  })
  vim.lsp.enable('rust_analyzer')

  -- LSP-driven autocompletion on attach
  vim.api.nvim_create_autocmd('LspAttach', {
	  callback = function(ev)
		  local client = vim.lsp.get_client_by_id(ev.data.client_id)
		  if client and client:supports_method('textDocument/completion') then
			  vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		  end
	  end,
  })
