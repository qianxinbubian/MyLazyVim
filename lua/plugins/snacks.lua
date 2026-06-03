return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          projects = {
            -- 自动扫描 ~/dev、~/projects 下所有含 .git 的子目录
            dev = { "~/dev", "~/projects" },
            patterns = { ".git", "package.json", "Makefile" },
            auto_root = true -- 自动设打开目录为项目
          }
        }
      },
      styles = {
        float = {
          wo = {
            wrap = false,
            scrolloff = 0,
            sidescrolloff = 4
          }
        },
        hover = {
          wo = { wrap = false },
          width = 0.7,
        },
        notification = {
          wo = { wrap = false },
        }
      }
    }
  },
}
