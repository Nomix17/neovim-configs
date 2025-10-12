local map = vim.keymap.set
local opts = { noremap = true, silent = true, nowait = true }

map('n', '<C-S-j>', '5j', opts)
map('n', '<C-S-k>', '5k', opts)
map('v', '<C-S-j>', '5j', opts)
map('v', '<C-S-k>', '5k', opts)

map('n', '<C-j>', 'gj', opts)
map('v', '<C-j>', 'gj', opts)
map('n', '<C-k>', 'gk', opts)
map('v', '<C-k>', 'gk', opts)

map('n', '<C-f>', ':NvimTreeFocus<CR>', opts)
map('n', '<C-b>', ':NvimTreeToggle<CR>', opts)

map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-S-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A-S->>', '<Cmd>BufferMoveNext<CR>', opts)

for i = 0, 9 do
  local lhs = i == 0 and "<A-0>" or "<A-" .. i .. ">"
  local rhs = i == 0 and "<Cmd>BufferLast<CR>" or ("<Cmd>BufferGoto " .. i .. "<CR>")
  map('n', lhs, rhs, opts)
end

map('n', '<A-d>', '<Cmd>BufferClose<CR>', opts)
map('n', '<A-S-D>', '<Cmd>BufferRestore<CR>', opts)
map('n', '<A-p>', '<Cmd>BufferPick<CR>', opts)
map('n', '<A-S-p>', '<Cmd>BufferPickDelete<CR>', opts)

map('n', 'q', "~", opts)
map('v', 'q', "~", opts)
map('n', '<C-a>', 'ggVG', opts)
map('n', "<", "<<", opts)
map('n', ">", ">>", opts)
map('n', ".", "dl", opts)
map('n', ",", "dh", opts)

map('i', "jj", "<ESC>", opts)
map('i', "JJ", "<ESC>", opts)
map('i', "Jj", "<ESC>", opts)
map('i', "jJ", "<ESC>", opts)

map('n', 'dd', '"_dd', opts)
map('n', 'd', '"_d', opts)
map('v', 'd', '"_d', opts)

map('n', 'xx', 'dd', opts)
map('v', 'x', 'd', opts)
map('n', 'xe', 'de', opts)
map('n', 'x$', 'd$', opts)

map('n', 'm', '%', opts)
map('n', 'M', '%', opts)
map('v', 'm', '%', opts)
map('v', 'M', '%', opts)
map('n', '[m', '[{', opts)
map('n', ']m', ']}', opts)
map('v', '[m', '[{', opts)
map('v', ']m', ']}', opts)

map('n', '<C-d>', 'ggdG', opts)


vim.api.nvim_set_keymap('i', '<A-Space>', 'v:lua.require("blink.cmp").trigger()', { expr = true, noremap = true })

local diagnostics_enabled = true

vim.keymap.set('n', '<A-Space>', function()
  if diagnostics_enabled then
    vim.diagnostic.disable()
    diagnostics_enabled = false
  else
    vim.diagnostic.enable()
    diagnostics_enabled = true
  end
end, { desc = "Toggle LSP error highlighting" })

