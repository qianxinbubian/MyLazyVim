# MyLazyVim

My own LazyVim configs



# Keymaps

* I never change the defualt **Leader** key as **\<Space\>**, I define my own leaderkey as **;**

## My own key maps:
```lua
map({ "i", "v", "c" }, "jk", "<ESC>", { desc = "exit insert mode", remap = true })
map("n", mymapleader .. "w", "<cmd>wa<cr>", { desc = "save all" })
map("n", mymapleader .. "q", "<cmd>wq<cr>", { desc = "save quit" })
map("n", mymapleader .. "<s-q>", "<cmd>q!<cr>", { desc = "Quit not save" })
map("n", mymapleader .. mymapleader .. "n", "<cmd>set nu<cr><cmd>set rnu<cr>", { desc = "set rnu" })
map("i", mymapleader .. "0", "<esc>0i", { desc = "return head in insert" })
map("i", mymapleader .. "4", "<esc>A", { desc = "move to tail in insert" })
map("n", mymapleader .. "e", "%", { desc = "move matchit" })
map("n", mymapleader .. "b", "<cmd>Vista nvim_lsp<cr>", { desc = "Toggle vista sidebar" })
map("n", mymapleader .. "ch", "<cmd>A<cr>", { desc = "switch source and header" })
map("n", mymapleader .. "g", "<cmd>IH<cr>", { desc = "move matchit" })
map("n", mymapleader .. "v", "<cmd>AV<cr>", { desc = "move matchit" })
-- map("n", "<leader>p", "<cmd>bprevious<cr>", { desc = "Prev Buffer" }) -- use '<S-h> and <S-l>'
-- map("n", "<leader>m", "<cmd>bnext<cr>", { desc = "Next Buffer" })

map("i", "<C-h>", "<Left>", { desc = "Go to Left Window", remap = true })
map("i", "<C-j>", "<Down>", { desc = "Go to Lower Window", remap = true })
map("i", "<C-k>", "<Up>", { desc = "Go to Upper Window", remap = true })
map("i", "<C-l>", "<Right>", { desc = "Go to Right Window", remap = true })

map("n", mymapleader .. "h", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", mymapleader .. "j", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", mymapleader .. "k", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", mymapleader .. "l", "<C-w>l", { desc = "Go to Right Window", remap = true })
```

## disable LazyVim default keymaps
- comment the `<C-k>` in `Lazyvim/lua/lazyvim/plugins/lsp/keymaps.lua`, desc is `Signature Help`

# Plugins

* a-vim.lua

  * switch c/c++ source/header
  - remove `<Leader>ihn` `<Leader>is` `<Leader>ig` in a.vim

* indentcomment.lua

  * a useful comment plugin, line comment/block comment

* rainbow.lua

  * a colorful bow, rainbow-delimiters.nvim

* vim-multiple-cursor.lua

  * multiple select cursor on same variable, you can chang them

* vista.lua

  * a symbols display plugin, functions, variable, macros, class, enums...

* coc.nvim
  * never use lazyvim own complete function, use coc
  * the plugins include: `coc-snippets, coc-links, coc-location, coc-symbols, coc-outline, coc-explorer, coc-translation, coc-diagnostics, coc-notifications`

* lazygit.lua
  * integrity lazygit function