return {
  "terryma/vim-multiple-cursors",
  config = function()
    vim.g.multi_cursor_next_key = "<c-n>"
    vim.g.multi_cursor_prev_key = "<c-p>"
    vim.g.multi_cursor_skip_key = "<c-x>"
    vim.g.multi_cursor_quit_key = "<esc>"
    --    vim.g.multi_cursor_select_all_word_key = '<c-q>'
  end,
}
