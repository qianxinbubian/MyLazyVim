-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- 
-- ==============================================
-- 强制 coc.nvim 所有悬浮窗：不换行、可水平滚动
-- ==============================================
vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
  pattern = {
    "coc-hover"
    --"coc-diagnostic",
    --"coc-signature",
  },
  callback = function()
    -- 只作用于浮动窗口
    local winid = vim.api.nvim_get_current_win()
    local config = vim.api.nvim_win_get_config(winid)
    if config.relative ~= "" then
      vim.wo.wrap = false
      vim.wo.linebreak = false
      vim.wo.breakindent = false
      vim.wo.textwidth = 0
      vim.wo.sidescrolloff = 5
    end
  end,
})
