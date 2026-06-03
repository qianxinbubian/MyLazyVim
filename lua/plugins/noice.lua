return {
  "folke/noice.nvim",
  opts = {
    views = {
      -- 全局所有浮动视图
      hover = {
        border = "rounded",
        win_options = {
          wrap = false,  -- 不换行
          linebreak = false,
        },
      },
      -- 覆盖：LSP 悬停
      lsp_hover = {
        border = "rounded",
        win_options = {
          wrap = false,
        },
      },
      -- 覆盖：弹出式菜单/预览
      popup = {
        win_options = { wrap = false },
      },
    },
    -- 确保 LSP 文档用 Noice 渲染
    lsp = {
      hover = { enabled = true },
      signature = { enabled = true },
    },
  },
}
