local cmp = require('cmp')

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "eslint", "lua_ls", "gopls", "html", "ast_grep", "ltex"}, -- add more here
})

local lspconfig = require("lspconfig")

-- This will automatically setup all installed servers using lspconfig
require("mason-lspconfig").setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = require("cmp_nvim_lsp").default_capabilities()
    })
  end,
})

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  })
})


