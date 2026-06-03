-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.shell = "powershell"
vim.g.autoformat = false
vim.g.root_spec = { "lsp", "cwd" }
