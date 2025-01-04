require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 7

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
vim.keymap.set('n', '<C-å>', '<C-]>', { noremap = true, silent = true }) -- CTRL-] does not work

-- highlight when yanking (copying) text
-- try it with `yap` in normal mode
-- see `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- set no numbers in :terminal
vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Open neovim terminal',
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

-- just a shortcut to start :terminal
-- might not be needed
vim.keymap.set("n", "<space>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 5)
end
)

-- oil.nvim
--require("oil").setup({
--view_options = {
--show_hidden = true,
--},
--})
--vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
