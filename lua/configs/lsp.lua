local blink = require'blink.cmp'

blink.setup({
  appearance = { use_nvim_cmp_as_default = true, nerd_font_variant = 'mono' },
  completion = {
    accept = { auto_brackets = { enabled = true } },
    documentation = { auto_show = true, auto_show_delay_ms = 250, treesitter_highlighting = true },
    auto_show = true,
    auto_accept = false,
    debounce_ms = 100,
    ghost_text = { enabled = false },
  },
  sources = { default = { 'lsp', 'path', 'buffer' } },
  snippets = { preset = 'luasnip' },
  signature = { enabled = true },
  keymap = {
    ['<A-l>'] = { 'select_and_accept', 'fallback' },
    ['<A-j>'] = { 'select_next', 'fallback' },
    ['<A-k>'] = { 'select_prev', 'fallback' },
    ['<A-e>'] = { 'hide' },
  },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, blink.get_lsp_capabilities())

require("mason").setup()
require("mason-lspconfig").setup({ automatic_installation = true })

local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
local installed_servers = require("mason-lspconfig").get_installed_servers()

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
