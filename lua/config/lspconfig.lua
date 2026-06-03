
-- local lspconfig = require('lspconfig')
--
-- -- clangd setup
-- lspconfig.clangd.setup {
-- --  capabilities = require('cmp_nvim_lsp').default_capabilities(),
--   cmd = {
--     "clangd",
--     "--background-index",
--     "--clang-tidy",
--     "--header-insertion=iwyu"
--   },
--   filetypes = {"c", "cpp", "objc", "objcpp"},
-- }

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
    "clangd",
    "cmake",
	},
})

local lspconfig = require('lspconfig')

require("mason-lspconfig").setup_handlers({
  function (server_name)
    require("lspconfig")[server_name].setup{}
  end,
  -- Next, you can provide targeted overrides for specific servers.
  ["lua_ls"] = function ()
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
    }
  }
  end,
  ["clangd"] = function ()
    lspconfig.clangd.setup {
      cmd = {
        "clangd",
        "--header-insertion=never",
--        "--query-driver=/opt/homebrew/opt/llvm/bin/clang",
        "--all-scopes-completion",
        "--completion-style=detailed",
      }
    }
  end
})

-- 在 Lua 配置中
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
--   local filtered_diagnostics = {}
--   for _, diagnostic in ipairs(result.diagnostics) do
--     -- 过滤掉包含 "unused" 的诊断
--     if not string.find(diagnostic.message:lower(), "unused") then
--       table.insert(filtered_diagnostics, diagnostic)
--     end
--   end
--   result.diagnostics = filtered_diagnostics
--   vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
-- end
