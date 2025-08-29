return {
  "liuchengxu/vista.vim",
  config = function()
    vim.g.vista_default_executive = "lsp"
    vim.g.vista_update_on_text_changed = 1
    vim.g.vista_cursor_delay = 100
    vim.g.vista_echo_cursor = 1
    vim.g.vista_echo_cursor_strategy = "floating_win"
    vim.g.vista_update_on_text_changed_delay = 100
    vim.g.vista_fzf_preview = "right:50%"
    --    vim.g.vista_icon_indent = "['╰─▸ ', '├─▸ ']"
  end,
}
