return {
  {
    "morhetz/gruvbox" ,
    enable = true,
    lazy = false,
    config = function()
      vim.cmd("colorscheme gruvbox")
      vim.o.background = "light"
    end,
  },
   --{
     --"altercation/vim-colors-solarized" ,
     --enable = true,
     --lazy = false,
     --config = function()
       --vim.cmd("colorscheme solarized")
       --vim.o.background = "light"
     --end,
   --},
}
