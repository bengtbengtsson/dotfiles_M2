-- C-x C-o --> omnicompletion (:h ins-completion)
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
      require("lspconfig").lua_ls.setup {}
      -- <space>> to go to definition
      -- C-t to jump back
      -- local x = 5
      -- print(x)
    end
  }
}
