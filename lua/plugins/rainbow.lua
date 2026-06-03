return {
  "HiPhish/rainbow-delimiters.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    -- 这行很重要，需要先导入 rainbow-delimiters
    local rainbow_delimiters = require 'rainbow-delimiters'

    require('rainbow-delimiters.setup')({
      strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
      },
      priority = {
        [''] = 110,
        lua = 210,
      },
      highlight = {
        -- 这里可以设置你喜欢的颜色。
        -- 颜色名可以参考 nvim 内置的颜色组，或者你 colorscheme 中的颜色组。
        -- 例如：'RainbowDelimiterRed', 'RainbowDelimiterYellow', 'RainbowDelimiterBlue', 'RainbowDelimiterOrange', 'RainbowDelimiterGreen', 'RainbowDelimiterViolet', 'RainbowDelimiterCyan'
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
      -- 如果你的黑白名单留空，则对所有文件类型生效
      --blacklist = {}, -- 例如：{ 'c', 'cpp' } 表示不在这两种文件类型中启用
      --whitelist = {}, -- 例如：{ 'lua', 'python' } 表示只在这两种文件类型中启用
    })
  end
}
