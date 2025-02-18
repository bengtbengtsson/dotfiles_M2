-- cd /Users/ben/.config/nvimexample
-- NVIM_APPNAME=nvimexample nvim init.lua

-- echo: nvim_list_runtime_paths()
-- show where nvim looks for .lua files
--

require("config.lazy")

vim.opt.shiftwidth = 2

vim.opt.clipboard = "unnamedplus"

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

-- :fc close a floating window

-- C-w C-w --> change to next window

-- the 'C-[' and 'C-]' does not work on my keyboard/system
vim.keymap.set("n", "<space>>", "<C-]>")
vim.keymap.set("n", "<space><", "<C-[>")

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank2", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local formatters = {
  lua = "stylua --stdin-filepath % -", -- Note the trailing dash
  python = "black -q -",
  javascript = "prettier --stdin-filepath %",
  typescript = "prettier --stdin-filepath %",
  json = "jq '.'",
  go = "gofmt",
  rust = "rustfmt",
  c = "clang-format",
  cpp = "clang-format",
}

function FormatFile()
  local ft = vim.bo.filetype -- Get current file type
  local cmd = formatters[ft] -- Look up the formatter

  if cmd then
    local binary = vim.split(cmd, " ")[1]
    if vim.fn.executable(binary) == 1 then
      local cursor = vim.api.nvim_win_get_cursor(0)
      local view = vim.fn.winsaveview()
      local buffer_content = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")

      -- Get current file name, or fallback if unsaved
      local filename = vim.fn.expand("%")
      if filename == "" then
        filename = "unsaved." .. ft -- e.g., unsaved.lua
      end

      -- Replace % with the filename (including the dash in the command)
      local formatted = vim.fn.system(cmd:gsub("%%", filename), buffer_content)

      if vim.v.shell_error == 0 then
        vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(formatted, "\n"))
      else
        print("Formatting failed for " .. ft)
      end

      vim.api.nvim_win_set_cursor(0, cursor)
      vim.fn.winrestview(view)
    else
      print("Formatter for " .. ft .. " not installed!")
      vim.cmd("normal! gg=G") -- fallback formatting
    end
  else
    vim.cmd("normal! gg=G") -- fallback formatting
  end
end

-- Map it to <leader>f
vim.api.nvim_set_keymap("n", "<leader>fo", ":lua FormatFile()<CR>", { noremap = true, silent = true })


-- Function to jump to the tag under the cursor, with error handling
local function jump_to_tag()
  local keyword = vim.fn.expand("<cword>") -- Get the word under the cursor
  if keyword == "" then
    print("No keyword under cursor")
    return
  end

  -- Check if a tags file exists
  local tags_path = vim.fn.findfile("tags", ".;") -- Look for "tags" file in the current dir or above
  if tags_path == "" then
    print("⚠️ No 'tags' file found. Run ':h tags' for setup instructions.")
    return
  end

  -- Execute the :tag command
  vim.cmd("tag " .. keyword)
end

-- Map <Space>ft to jump_to_tag function
vim.keymap.set('n', '<Space>ft', jump_to_tag, { noremap = true, silent = true, desc = "Follow tag" })

