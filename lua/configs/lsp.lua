-- LSP Configuration for Neovim
-- This file sets up LSP servers, completion (nvim-cmp), and related keymaps

-- Setup nvim-cmp (completion engine)
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = {
      border = 'rounded',
      winhighlight = 'Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None',
    },
    documentation = {
      border = 'rounded',
      winhighlight = 'Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None',
    },
  },
  mapping = cmp.mapping.preset.insert({
    ['<A-j>'] = cmp.mapping.select_next_item(),
    ['<A-k>'] = cmp.mapping.select_prev_item(),
    ['<A-l>'] = cmp.mapping.confirm({ select = true }),
    ['<A-e>'] = cmp.mapping.abort(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  }, {
    { name = 'buffer' },
  }),
})

-- Setup LSP capabilities with nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup Mason (LSP installer)
require("mason").setup()
require("mason-lspconfig").setup({ 
  automatic_installation = true 
})

-- Setup LSP keymaps when a language server attaches to a buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, noremap = true, silent = true }
    
    -- LSP navigation keymaps
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, opts)
    
    -- LSP actions
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format({ async = true })
    end, opts)
    
    -- Diagnostics
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
  end,
})

-- Configure LSP servers
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
local installed_servers = require("mason-lspconfig").get_installed_servers()

-- Setup all installed LSP servers except jdtls (which needs special config)
for _, server in ipairs(installed_servers) do
  if server ~= "jdtls" then
    lspconfig[server].setup({
      capabilities = capabilities,
      root_dir = function(fname)
        return util.root_pattern(".git")(fname) or vim.fn.getcwd()
      end,
    })
  end
end

-- Special setup for Java (jdtls) with workspace support
local jdtls_bin = vim.fn.expand("~/.local/share/nvim/mason/packages/jdtls/bin/jdtls")
local workspace_dir = vim.fn.expand("~/.local/share/eclipse/") .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

lspconfig.jdtls.setup({
  cmd = { jdtls_bin, "-data", workspace_dir },
  capabilities = capabilities,
  root_dir = function(fname)
    return util.root_pattern("pom.xml", "build.gradle", ".git")(fname)
      or vim.fn.getcwd()
  end,
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
    },
  },
})
