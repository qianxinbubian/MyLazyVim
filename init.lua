-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

--vim.g.loaded_python3_provider = nil
--vim.g.python3_host_prog = "C:\\Users\\admin\\AppData\\Local\\Programs\\Python\\Python313\\Python.exe"
vim.opt.tabstop=2
vim.opt.softtabstop=2
vim.opt.shiftwidth=2
vim.opt.expandtab=true

require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,          -- 全局保持开启
    disable = { "c", "cpp" }, -- 只关闭 C/C++ 的 treesitter 高亮
  },
})
-- auto delete shada.tmp.? files 
vim.api.nvim_create_autocmd({ 'VimLeavePre' }, {
    group = vim.api.nvim_create_augroup('fuck_shada_temp', { clear = true }),
    pattern = { '*' },
    callback = function()
        local status = 0
        for _, f in ipairs(vim.fn.globpath(vim.fn.stdpath('data') .. '/shada', '*tmp*', false, true)) do
            if vim.tbl_isempty(vim.fn.readfile(f)) then
                status = status + vim.fn.delete(f)
            end
        end
        if status ~= 0 then
            vim.notify('Could not delete empty temporary ShaDa files.', vim.log.levels.ERROR)
            vim.fn.getchar()
        end
    end,
    desc = "Delete empty temp ShaDa files"
})

vim.opt.shadafile = "NONE"
vim.api.nvim_create_autocmd("CmdlineEnter", {
    once = true,
    callback = function()
        local shada = vim.fn.stdpath("data") .. "/shada/main.shada"
        vim.o.shadafile = shada
        vim.api.nvim_command("rshada! " .. shada)
    end,
})

if vim.g.neovide then
-- 在 init.lua 中显示 Git 分支信息
local function get_git_branch()
    local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
    if handle then
        local result = handle:read("*a")
        handle:close()
        if result and result ~= "" then
            return "[" .. result:gsub("\n", "") .. "]"
        end
    end
    return ""
end

local function update_title_with_git()
    local file_path = vim.fn.expand("%:p")
    local file_name = vim.fn.expand("%:t")
    local modified = vim.bo.modified and "[+]" or ""
    local git_branch = get_git_branch()
    if file_path == "" then
        return string.format("Neovim - [无标题] %s", git_branch)
    else
        return string.format("Neovim - %s %s %s", file_path, modified, git_branch)
    end
end

-- 设置自动命令来更新标题
vim.api.nvim_create_autocmd({"BufEnter", "BufModifiedSet", "FocusGained"}, {
    callback = function()
        vim.opt.titlestring = update_title_with_git()
    end
})
vim.opt.title = true
vim.o.guifont = "Cascadia Mono:h13" -- text below applies for VimScript
    --vim.opt.titlestring = [[Neovim: %(%M%)%{expand("%:p")}]]
--   vim.opt.linespace = 0
--   vim.g.neovide_scale_factor = 1.0
-- vim.g.neovide_text_gamma = 0.0
-- vim.g.neovide_text_contrast = 0.5
--
-- vim.g.neovide_padding_top = 0
-- vim.g.neovide_padding_bottom = 0
-- vim.g.neovide_padding_right = 0
-- vim.g.neovide_padding_left = 0
-- -- Helper function for transparency formatting
-- local alpha = function()
--   return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
-- end
-- -- g:neovide_opacity should be 0 if you want to unify transparency of content and title bar.
-- vim.g.transparency = 0.8
-- vim.g.neovide_background_color = "#0f1117" .. alpha()
vim.g.neovide_title_background_color = string.format(
    "%x",
    vim.api.nvim_get_hl(0, {id=vim.api.nvim_get_hl_id_by_name("Normal")}).bg
)
--
-- vim.g.neovide_title_text_color = "pink"
-- vim.g.neovide_window_blurred = true
-- vim.g.neovide_floating_blur_amount_x = 2.0
-- vim.g.neovide_floating_blur_amount_y = 2.0
-- vim.g.neovide_floating_shadow = true
-- vim.g.neovide_floating_z_height = 10
-- vim.g.neovide_light_angle_degrees = 45
-- vim.g.neovide_light_radius = 5
-- vim.g.neovide_floating_corner_radius = 0.0
-- vim.g.neovide_opacity = 0
-- vim.g.neovide_normal_opacity = 0.8
-- vim.g.neovide_show_border = true
-- vim.g.neovide_position_animation_length = 0.15
vim.g.neovide_scroll_animation_length = 0.04
vim.g.neovide_scroll_animation_far_lines = 3
-- vim.g.neovide_hide_mouse_when_typing = false
-- vim.g.neovide_underline_stroke_scale = 1.0
-- vim.g.neovide_theme = 'auto'
-- vim.g.experimental_layer_grouping = false
-- vim.g.neovide_refresh_rate = 60
-- vim.g.neovide_refresh_rate_idle = 5
-- vim.g.neovide_no_idle = true
-- vim.g.neovide_confirm_quit = true
-- vim.g.neovide_detach_on_quit = 'always_quit'
-- vim.g.neovide_fullscreen = true
-- vim.g.neovide_macos_simple_fullscreen = true
-- vim.g.neovide_remember_window_size = true
-- vim.g.neovide_profiler = false
-- vim.g.neovide_cursor_hack = true
-- vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
-- vim.g.neovide_input_ime = true
-- vim.g.neovide_touch_deadzone = 6.0
-- vim.g.neovide_touch_drag_timeout = 0.17
vim.g.neovide_cursor_animation_length = 0.050
-- vim.g.neovide_cursor_short_animation_length = 0.04
vim.g.neovide_cursor_trail_size = 0.2
-- vim.g.neovide_cursor_antialiasing = true
-- vim.g.neovide_cursor_animate_command_line = true
-- vim.g.neovide_cursor_unfocused_outline_width = 0.125
-- vim.g.neovide_cursor_smooth_blink = false
-- vim.g.neovide_cursor_vfx_mode = ""
-- -- vim.g.neovide_cursor_vfx_mode = {"", ""}
-- -- vim.g.neovide_cursor_vfx_mode = "railgun"
-- -- vim.g.neovide_cursor_vfx_mode = "torpedo"
-- -- vim.g.neovide_cursor_vfx_mode = "pixiedust"
-- -- vim.g.neovide_cursor_vfx_mode = "sonicboom"
-- -- vim.g.neovide_cursor_vfx_mode = "ripple"
-- -- vim.g.neovide_cursor_vfx_mode = "wireframe"
-- vim.g.neovide_cursor_vfx_opacity = 200.0
-- vim.g.neovide_cursor_vfx_particle_lifetime = 0.5
-- vim.g.neovide_cursor_vfx_particle_highlight_lifetime = 0.2
-- vim.g.neovide_cursor_vfx_particle_density = 0.7
-- vim.g.neovide_cursor_vfx_particle_speed = 30.0
-- vim.g.neovide_cursor_vfx_particle_phase = 1.5
-- vim.g.neovide_cursor_vfx_particle_curl = 1.0
end

-- coc.nvim settings
vim.g.coc_node_path = 'C:\\Program Files\\nodejs\\node.exe'
vim.g.coc_npm_path = 'C:\\Program Files\\nodejs'
--vim.g.coc_python3_host_prog = vim.g.python3_host_prog
-- https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.lua

-- Some servers have issues with backup files, see #649
vim.opt.backup = false
vim.opt.writebackup = false

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
keyset("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation
keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
keyset("n", "gr", "<Plug>(coc-references)", {silent = true})


-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})


-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

-- Symbol renaming
keyset("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})


-- Formatting selected code
keyset("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
keyset("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})


-- Setup formatexpr specified filetype(s)
vim.api.nvim_create_autocmd("FileType", {
    group = "CocGroup",
    pattern = "typescript,json",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
})

-- Apply codeAction to the selected region
-- Example: `<leader>aap` for current paragraph
local opts = {silent = true, nowait = true}
keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

-- Remap keys for apply code actions at the cursor position.
keyset("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", opts)
-- Remap keys for apply source code actions for current file.
keyset("n", "<leader>as", "<Plug>(coc-codeaction-source)", opts)
-- Apply the most preferred quickfix action on the current line.
keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

-- Remap keys for apply refactor code actions.
keyset("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
keyset("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
keyset("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

-- Run the Code Lens actions on the current line
keyset("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)

-- coc-example-config
keyset('n', ";t", ':<C-u>exec("CocCommand explorer --toggle --position left " . "--width 40")<Cr>', opts)

-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server
keyset("x", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("o", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("x", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("o", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("x", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("o", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("x", "ac", "<Plug>(coc-classobj-a)", opts)
keyset("o", "ac", "<Plug>(coc-classobj-a)", opts)


-- Remap <C-f> and <C-b> to scroll float windows/popups
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true, expr = true}
keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
keyset("i", "<C-f>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
keyset("i", "<C-b>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)


-- Use CTRL-S for selections ranges
-- Requires 'textDocument/selectionRange' support of language server
keyset("n", "<C-s>", "<Plug>(coc-range-select)", {silent = true})
keyset("x", "<C-s>", "<Plug>(coc-range-select)", {silent = true})

-- Use coc-transplate
keyset("n", "<space>p", "<Plug>(coc-translator-p)", {silent = true})
keyset("v", "<space>p", "<Plug>(coc-translator-pv)", {silent = true})
--keyset("n", "te", "<Plug>(coc-translator-e)", {silent = true})
--keyset("v", "te", "<Plug>(coc-translator-ev)", {silent = true})
--keyset("n", "tr", "<Plug>(coc-translator-r)", {silent = true})
--keyset("v", "tr", "<Plug>(coc-translator-rv)", {silent = true})

-- Use coc-clangd
--keyset("n", ";ch", ":CocCommand clangd.switchSourceHeader<cr>", {silent = true})
--keyset("n", ";vh", ":CocCommand clangd.switchSourceHeader vsplit<cr>", {silent = true})

-- Add `:Format` command to format current buffer
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

-- Add `:OR` command for organize imports of the current buffer
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Add (Neo)Vim's native statusline support
-- NOTE: Please see `:h coc-status` for integrations w))ith external plugins that
-- provide custom statusline: lightline.vim, vim-airline
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")
-- Mappings for CoCList
-- code actions and coc stuff
------@diagnostic disable-next-line: redefined-local
---local opts = {silent = true, nowait = true}
----- Show all diagnostics
---keyset("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
----- Manage extensions
---keyset("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
----- Show commands
---keyset("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
----- Find symbol of current document
---keyset("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
----- Search workspace symbols
---keyset("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts)
----- Do default action for next item
---keyset("n", "<space>j", ":<C-u>CocNext<cr>", opts)
----- Do default action for previous item
---keyset("n", "<space>k", ":<C-u>CocPrev<cr>", opts)
----- Resume latest coc list
---keyset("n", "<space>p", ":<C-u>CocListResume<cr>", opts)
