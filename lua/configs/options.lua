vim.o.mouse = 'a'
vim.o.termguicolors = true 
vim.o.background = "dark"
vim.g.python3_host_prog = '/usr/bin/python3'
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.wo.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.g.airline_theme = 'minimalist_gray'
vim.g.airline_powerline_fonts = 1


local original_notify = vim.notify
vim.notify = function(msg, log_level, opts)
  if log_level == vim.log.levels.WARN then
    return  -- ignore all warnings
  end
  original_notify(msg, log_level, opts)
end

vim.diagnostic.config({
  signs = false,
  virtual_text = true,
  underline = true,
  severity = { min = vim.diagnostic.severity.ERROR, max = vim.diagnostic.severity.ERROR }
})


vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
  if not result then return end
  local filtered = vim.tbl_filter(function(d)
    return d.severity == vim.diagnostic.severity.ERROR
  end, result.diagnostics)
  vim.lsp.diagnostic.on_publish_diagnostics(nil, { diagnostics = filtered, uri = result.uri }, ctx, config)
end


vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


