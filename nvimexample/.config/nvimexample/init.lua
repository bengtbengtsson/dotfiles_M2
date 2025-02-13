-- use this training nvim setup as below
-- cd /Users/ben/.config/nvimexample
-- NVIM_APPNAME=nvimexample nvim init.lua

-- echo: nvim_list_runtime_paths()
-- show where nvim looks for .lua files
require("config.lazy")

-- reload current file
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")

-- execute the lua command on line
-- note, the dot '.' is vim for 'current line'
vim.keymap.set("n", "<space>x", ":.lua<CR>")

-- exectute the lua command on the selected lines
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- show all in the 'vim' table
-- :lua =vim

-- show all in the 'vim.keymap' table
-- :lua =vim.keymap

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank2', { clear = true}),
	callback = function()
		vim.highlight.on_yank()
	end
})
