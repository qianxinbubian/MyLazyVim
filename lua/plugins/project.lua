return {
  {
  "ahmedkhalf/project.nvim",
  opts = {
    -- Manual mode doesn't automatically change your root directory, so you have
    -- the option to manually do so using `:ProjectRoot` command.
    manual_mode = false,

    -- Methods of detecting the root directory. **"lsp"** uses the native neovim
    -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
    -- order matters: if one is not detected, the other is used as fallback. You
    -- can also delete or rearangne the detection methods.
    detection_methods = { "lsp", "pattern" },

    -- 👇 识别项目根的标记（按需增删）
    patterns = {
      ".git", "Makefile", "package.json", "pyproject.toml",
      "go.mod", "compile_commands.json", "CMakeLists.txt"
    },
    -- 自动切换目录（无提示）
    -- When set to false, you will get a message when project.nvim changes your
    -- directory.
    silent_chdir = true,
    -- 排除目录
    exclude_dirs = { "node_modules", "target", "build" },

    -- Table of lsp clients to ignore by name
    -- eg: { "efm", ... }
    ignore_lsp = {},

    -- Show hidden files in telescope
    show_hidden = false,


    -- What scope to change the directory, valid options are
    -- * global (default)
    -- * tab
    -- * win
    scope_chdir = 'win',

    -- Path where project.nvim will store the project history for use in
    -- telescope
    datapath = vim.fn.stdpath("data"),
  },
  config = function(_, opts)
    require("project_nvim").setup(opts)
    -- 加载 Telescope 扩展
    LazyVim.on_load("telescope.nvim", function()
      require("telescope").load_extension("projects")
    end)
  end,
  keys = {
    { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Projects" }
  }
  }
}
