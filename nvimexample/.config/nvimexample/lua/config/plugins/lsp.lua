-- C-x C-o --> omnicompletion (:h ins-completion)
--
-- :lua vim.lsp.buf.format()
--
--
-- also, a .editorconfig file will be read by neovim and lsp (providing info on tabstops etc)
--
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      require("lspconfig").lua_ls.setup {
        settings = {
          Lua = {
            format = { enable = false } -- disable lsp formatting
          }
        }
      }

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function()
          print("LSP ATTACHED")
        end
      })
      -- <space>> to go to definition
      -- C-t to jump back
      -- local x = 5
      -- print(x)
    end
  }
}
